class SessionsController < ApplicationController

	skip_before_filter :authorize,:api_authorize

	def new

		render 'login',layout: 'splash'

	end

	def create

		user = User.find_by_email params[:email]

		if user && !user.floating && user.authenticate(params[:password])

			session[:user_id] = user.id

			redirect_to root_url, flash: {success: "Welcome #{params[:email]}!"}

		else

			# @email = params[:email]

			flash[:danger] = 'Email or password is invalid'

			render 'login',layout: 'splash'

			flash.delete :danger

		end

	end

	def destory

		session.delete :user_id

		reset_session if params[:reset] == 'true'

		redirect_to root_url, flash: {warning: 'You have been logged out!'}

	end

	def request_password_reset

		render 'request',layout: 'splash'

	end

	def request_password_send_email

		@user = User.find_by_email params.require(:email)

		@user.token_expiration = Time.now + 10*60 # 10 minutes
		@user.token = SecureRandom.urlsafe_base64

		if @user.save

			UserMailer.request_password_reset(@user).deliver

			@message = {
				type: 'warning',
				text: "An email was sent to #{@user.email} with a link to reset your password."
			}

			render 'message',layout: 'splash'

		else

			render json: @user.errors,status: :unprocessable_entity

		end

	end

	def set_new_password

		@user = User.find_by_token params.require(:token)
		@time = Time.now
		diff = @time.to_i - @user.token_expiration.to_i

		if @user

			if diff > 0

				@message = {
					type: 'warning',
					text: "Token expired."
				}

				render 'message',layout: 'splash'
				return false

			end

			render 'new_password',layout: 'splash'

		else

			render json: @user.errors,status: :unprocessable_entity

		end

	end

	def change_password

		@user = User.find_by_token user_params[:token]

		if !user_params.has_key?(:password) || user_params[:password].blank?
			flash[:danger] = 'Password is required.'
			render 'new_password',layout: 'splash'
			flash.delete :danger
			return false
		end

		if @user.update(user_params)

			redirect_to login_url,layout: 'splash',flash: {success: 'Your new password has been set! Login here.'}

		else

			render 'new_password',layout: 'splash'

		end

	end

	private
	def user_params
		params.require(:user).permit plist
	end

	def plist
		[:password_confirmation,:password,:token]
    end

end
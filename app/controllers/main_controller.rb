class MainController < ApplicationController

	skip_before_filter :authorize,:api_authorize
	
	def index

		if current_user.nil?

			@user = User.new if user_table

			id = EIDS[rand(0..EIDS.count-1)]

			@p1 = User.find id
			@p1_chimes = Chime.where user_id: id
			@p1_socials = Social.where user_id: id

			render 'splash',layout: 'splash'

		else

			render

		end

	end

	def create

		@user = User.new params[:user]

		if @user.save

			session[:user_id] = @user.id

			redirect_to root_url,flash: {success: 'Thank you for signing up!'}

		else

			render 'splash',layout: 'splash'

		end

	end

end
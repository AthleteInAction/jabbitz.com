module Api
  module V1
  	class UserController < ApplicationController

      before_action :set_user, only: [:show,:update,:destroy,:change_profile_image]

  		respond_to :json, except: [:change_profile_image]

  		# GET
  		# =================================================
  		# =================================================
  		def index

        new_params = params.permit plist
        social = new_params[:social]

        q = "SELECT users.* FROM users"
        if !social || social.to_s.strip == ''
          new_params.delete :social
          q << Tools.query(new_params)
        else
          q << Tools.squery(new_params)
        end

        puts '----'*10
        puts '----'*10
        puts q
        puts '----'*10
        puts '----'*10

  			@users = User.find_by_sql q

  			respond_with @users,root: :users

  		end
  		# =================================================
  		# =================================================


  		# GET
  		# =================================================
  		# =================================================
  		def show

  			respond_with @user

  		end
  		# =================================================
  		# =================================================


  		# PUT
  		# =================================================
  		# =================================================
  		def update

        sleep 1 if E.development?

        if @user.update(user_params)

          render json: @user,status: :ok

        else

          render json: {error: true,errors: @user.errors},status: :unprocessable_entity

        end

  		end
  		# =================================================
  		# =================================================


  		# POST
  		# =================================================
  		# =================================================
  		def create

        sleep 1 if E.development?

  			@user = User.new user_params

  			if @user.save

  				render json: @user,status: :created

  			else

  				render json: {error: true,errors: @user.errors},status: :unprocessable_entity

  			end

  		end
  		# =================================================
  		# =================================================


  		# DELETE
  		# =================================================
  		# =================================================
  		def destroy

        sleep 1 if E.development?

        if @user.destroy

          render json: {user: {id: params[:id].to_i}},status: :ok

        else

          render json: {error: true,errors: @user.errors},status: :unprocessable_entity

        end

  		end
  		# =================================================
  		# =================================================


      # PROFILE IMAGE
      # =================================================
      # =================================================
      def change_profile_image
        
        params.require(:file)

        if @user.update(image: params[:file])

          render json: @user,status: :ok

        else

          render json: {error: true,errors: @user.errors},status: :unprocessable_entity

        end

      end
      # =================================================
      # =================================================

      private
      # Use callbacks to share common setup or constraints between actions.
      def set_user
        @user = User.find params[:id]
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def user_params
        params.require(:user).permit plist
      end

      def plist
        [:social, :birthdate, :last_active, :promo_code, :floating, :author_id, :name, :email, :password, :password_confirmation, :gender, :birth_month, :birth_date, :birth_year, :phone, :address, :city, :state, :zip_code, :created_at, :updated_at]
      end

  	end
  end
end
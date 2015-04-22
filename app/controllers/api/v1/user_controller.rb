module Api
  module V1
  	class UserController < ApplicationController

      before_action :set_user, only: [:show, :update, :destroy, :change_profile_image]

  		respond_to :json, except: [:change_profile_image]


  		# GET
  		# =================================================
  		# =================================================
  		def index

        @users = User.find_by_sql Tools.query(params)

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

        if @user.update(user_params)

          render json: @user,status: 200

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

  			@user = User.new user_params

  			if @user.save

  				render json: @user,status: 201

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

        if @user.destroy

          render json: {user: {id: params[:id].to_i}},status: 200

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

          render json: @user,status: 200

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
        params.require(:user).permit :name, :email, :password, :password_confirmation, :gender, :birth_month, :birth_date, :birth_year, :phone, :address, :city, :state, :zip_code, :created_at, :updated_at
      end

  	end
  end
end
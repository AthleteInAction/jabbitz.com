module Api
  module V1
  	class UserController < ApplicationController


  		respond_to :json


  		# GET
  		# =================================================
  		# =================================================
  		def index

  			@users = User.all

  			respond_with @users,root: :users

  		end
  		# =================================================
  		# =================================================


  		# GET
  		# =================================================
  		# =================================================
  		def show

  			@user = User.find params[:id]

  			respond_with @user

  		end
  		# =================================================
  		# =================================================


  		# PUT
  		# =================================================
  		# =================================================
  		def update

  			@user = User.find params[:id]

        if @user.update(user_params)

          render json: @user,status: 200

        else

          render json: {error: true,errors: @user.errors},status: unprocessable_entity

        end

  		end
  		# =================================================
  		# =================================================


  		# POST
  		# =================================================
  		# =================================================
  		def create

  			@user = User.new params[:user]

  			if @user.save

  				render json: @user,status: 201

  			else

  				render json: {error: true,errors: @user.errors},status: unprocessable_entity

  			end

  		end
  		# =================================================
  		# =================================================


  		# DELETE
  		# =================================================
  		# =================================================
  		def destroy

  			@user = User.find params[:id]

        if @user.destroy

          render json: {user: {id: params[:id].to_i}},status: 200

        else

          render json: {error: true,errors: @user.errors},status: unprocessable_entity

        end

  		end
  		# =================================================
  		# =================================================

      private
      # Use callbacks to share common setup or constraints between actions.
      def set_user
        @user = User.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def user_params
        params.require(:user).permit(:name, :email, :password, :gender, :birth_month, :birth_date, :birth_year, :phone, :address, :city, :state, :zip_code, :created_at, :updated_at)
      end

  	end
  end
end
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

        if @user.update_attributes(params[:user])

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

  	end
  end
end
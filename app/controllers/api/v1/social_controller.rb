module Api
  module V1
  	class SocialController < ApplicationController


  		respond_to :json


  		# GET
  		# =================================================
  		# =================================================
  		def index

  			@socials = Social.all

  			respond_with @socials,root: :socials

  		end
  		# =================================================
  		# =================================================


  		# GET
  		# =================================================
  		# =================================================
  		def show

  			@social = Social.find params[:id]

  			respond_with @social

  		end
  		# =================================================
  		# =================================================


  		# PUT
  		# =================================================
  		# =================================================
  		def update

  			@social = Social.find params[:id]

        if @social.update_attributes(params[:social])

          render json: @social,status: 200

        else

          render json: {error: true,errors: @social.errors},status: unprocessable_entity

        end

  		end
  		# =================================================
  		# =================================================


  		# POST
  		# =================================================
  		# =================================================
  		def create
        sleep 1
  			@social = Social.new params[:social]

  			if @social.save

  				render json: @social,status: 201

  			else

  				render json: {error: true,errors: @social.errors},status: unprocessable_entity

  			end

  		end
  		# =================================================
  		# =================================================


  		# DELETE
  		# =================================================
  		# =================================================
  		def destroy
        sleep 1
  			@social = Social.find params[:id]

        if @social.destroy

          render json: {social: {id: params[:id].to_i}},status: 200

        else

          render json: {error: true,errors: @social.errors},status: unprocessable_entity

        end

  		end
  		# =================================================
  		# =================================================

  	end
  end
end
module Api
  module V1
  	class SocialController < ApplicationController

      before_action :set_social, only: [:show, :update, :destroy]

  		respond_to :json

  		# GET
  		# =================================================
  		# =================================================
  		def index

        q = "SELECT * FROM socials"
        q << Tools.query(params)

  			@socials = Social.find_by_sql q

  			respond_with @socials,root: :socials

  		end
  		# =================================================
  		# =================================================


  		# GET
  		# =================================================
  		# =================================================
  		def show

  			respond_with @social

  		end
  		# =================================================
  		# =================================================


  		# PUT
  		# =================================================
  		# =================================================
  		def update

        if @social.update(social_params)

          render json: @social,status: :ok

        else

          render json: {error: true,errors: @social.errors},status: :unprocessable_entity

        end

  		end
  		# =================================================
  		# =================================================


  		# POST
  		# =================================================
  		# =================================================
  		def create

  			@social = Social.new social_params

  			if @social.save

  				render json: @social,status: :created

  			else

  				render json: {error: true,errors: @social.errors},status: :unprocessable_entity

  			end

  		end
  		# =================================================
  		# =================================================


  		# DELETE
  		# =================================================
  		# =================================================
  		def destroy

        if @social.destroy

          render json: {social: {id: params[:id].to_i}},status: :ok

        else

          render json: {error: true,errors: @social.errors},status: :unprocessable_entity

        end

  		end
  		# =================================================
  		# =================================================

      private
      # Use callbacks to share common setup or constraints between actions.
      def set_social
        @social = Social.find params[:id]
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def social_params
        params.require(:social).permit :user_id,:uri,:created_at,:updated_at
      end

  	end
  end
end
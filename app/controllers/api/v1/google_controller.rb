module Api
  module V1
  	class GoogleController < ApplicationController

      before_action :set_google, only: [:show, :update, :destroy]

  		respond_to :json

  		# GET
  		# =================================================
  		# =================================================
  		def index

        q = params.require :q

        request = Request.get "https://www.googleapis.com/customsearch/v1?key=#{GKEY}&cx=#{GCX}&q=#{URI.encode(q)}"

  			respond_with request[:body]

  		end
  		# =================================================
  		# =================================================


  		# GET
  		# =================================================
  		# =================================================
  		def show

  			respond_with @google

  		end
  		# =================================================
  		# =================================================


  		# PUT
  		# =================================================
  		# =================================================
  		def update

        if @google.update(google_params)

          render json: @google,status: :ok

        else

          render json: {error: true,errors: @google.errors},status: :unprocessable_entity

        end

  		end
  		# =================================================
  		# =================================================


  		# POST
  		# =================================================
  		# =================================================
  		def create

  			@google = Google.new google_params

  			if @google.save

  				render json: @google,status: :created

  			else

  				render json: {error: true,errors: @google.errors},status: :unprocessable_entity

  			end

  		end
  		# =================================================
  		# =================================================


  		# DELETE
  		# =================================================
  		# =================================================
  		def destroy

        if @google.destroy

          render json: {google: {id: params[:id].to_i}},status: :ok

        else

          render json: {error: true,errors: @google.errors},status: :unprocessable_entity

        end

  		end
  		# =================================================
  		# =================================================

      private
      # Use callbacks to share common setup or constraints between actions.
      def set_google
        @google = Google.find params[:id]
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def google_params
        params.require(:google).permit plist
      end

      def plist
        [:q]
      end

  	end
  end
end
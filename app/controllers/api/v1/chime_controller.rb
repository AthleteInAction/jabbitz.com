module Api
  module V1
  	class ChimeController < ApplicationController

      before_action :set_chime, only: [:show, :update, :destroy]

  		respond_to :json

  		# GET
  		# =================================================
  		# =================================================
  		def index

        q = "SELECT * FROM chimes"
        q << Tools.query(params)

  			@chimes = Chime.find_by_sql q

  			respond_with @chimes,root: :chimes

  		end
  		# =================================================
  		# =================================================


  		# GET
  		# =================================================
  		# =================================================
  		def show

  			respond_with @chime

  		end
  		# =================================================
  		# =================================================


  		# PUT
  		# =================================================
  		# =================================================
  		def update

        if @chime.update(chime_params)

          render json: @chime,status: :ok

        else

          render json: {error: true,errors: @chime.errors},status: :unprocessable_entity

        end

  		end
  		# =================================================
  		# =================================================


  		# POST
  		# =================================================
  		# =================================================
  		def create

  			@chime = Chime.new chime_params

  			if @chime.save

  				render json: @chime,status: :created

  			else

  				render json: {error: true,errors: @chime.errors},status: :unprocessable_entity

  			end

  		end
  		# =================================================
  		# =================================================


  		# DELETE
  		# =================================================
  		# =================================================
  		def destroy

        if @chime.destroy

          render json: {chime: {id: params[:id].to_i}},status: :ok

        else

          render json: {error: true,errors: @chime.errors},status: :unprocessable_entity

        end

  		end
  		# =================================================
  		# =================================================

      private
      # Use callbacks to share common setup or constraints between actions.
      def set_chime
        @chime = Chime.find params[:id]
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def chime_params
        params.require(:chime).permit :author_id, :user_id, :category, :rating, :interaction_date, :site, :body, :body_html, :body_short, :employer, :job_title, :location, :school, :created_at, :updated_at
      end

  	end
  end
end
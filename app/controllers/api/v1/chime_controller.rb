module Api
  module V1
  	class ChimeController < ApplicationController

      before_action :set_chime, only: [:show, :update, :destroy]

  		respond_to :json

  		# GET
  		# =================================================
  		# =================================================
  		def index

        q = Tools.query(params)

        @chimes = Chime.where(q)
        .page(params[:page])
        .per((params[:limit] || 100).to_i)
        .order(params[:order])

  			respond_with @chimes,
        root: :chimes,
        meta: {
          current_page: @chimes.current_page,
          next_page: @chimes.next_page,
          prev_page: @chimes.prev_page,
          total_pages: @chimes.total_pages,
          total_count: @chimes.total_count,
          limit: (params[:limit] || 100).to_i
        }

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

        if params[:chime][:flagged] == 'true'

          @chime.increment(:flagged)

          new_params = {}

          chime_params.each do |key,val|

            new_params.merge! key => val if key.to_s != 'flagged'

          end

        else

          new_params = chime_params

        end

        if @chime.update(new_params)

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
        params.require(:chime).permit :flagged, :author_id, :user_id, :category, :rating, :interaction_date, :site, :body, :body_html, :body_short, :employer, :job_title, :location, :school, :created_at, :updated_at
      end

  	end
  end
end
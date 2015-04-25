module Api
  module V1
  	class <%= name.capitalize %>Controller < ApplicationController

      before_action :set_<%= name %>, only: [:show, :update, :destroy]

  		respond_to :json

  		# GET
  		# =================================================
  		# =================================================
  		def index

        q = "SELECT * FROM <%= name %>s"
        q << Tools.query(params)

        @<%= name %>s = Chime.find_by_sql q

  			@<%= name %>s = <%= name.capitalize %>.find_by_sql Tools.query(params)

  			respond_with @<%= name %>s,root: :<%= name %>s

  		end
  		# =================================================
  		# =================================================


  		# GET
  		# =================================================
  		# =================================================
  		def show

  			respond_with @<%= name %>

  		end
  		# =================================================
  		# =================================================


  		# PUT
  		# =================================================
  		# =================================================
  		def update

        if @<%= name %>.update(<%= name %>_params)

          render json: @<%= name %>,status: :ok

        else

          render json: {error: true,errors: @<%= name %>.errors},status: :unprocessable_entity

        end

  		end
  		# =================================================
  		# =================================================


  		# POST
  		# =================================================
  		# =================================================
  		def create

  			@<%= name %> = <%= name.capitalize %>.new <%= name %>_params

  			if @<%= name %>.save

  				render json: @<%= name %>,status: :created

  			else

  				render json: {error: true,errors: @<%= name %>.errors},status: :unprocessable_entity

  			end

  		end
  		# =================================================
  		# =================================================


  		# DELETE
  		# =================================================
  		# =================================================
  		def destroy

        if @<%= name %>.destroy

          render json: {<%= name %>: {id: params[:id].to_i}},status: :ok

        else

          render json: {error: true,errors: @<%= name %>.errors},status: :unprocessable_entity

        end

  		end
  		# =================================================
  		# =================================================

      private
      # Use callbacks to share common setup or constraints between actions.
      def set_<%= name %>
        @<%= name %> = <%= name.capitalize %>.find params[:id]
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def <%= name %>_params
        params.require(:<%= name %>).permit :created_at, :updated_at
      end

  	end
  end
end
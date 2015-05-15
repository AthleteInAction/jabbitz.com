module Api
  module V1
  	class UserController < ApplicationController

      before_action :set_user, only: [:show,:update,:destroy,:change_profile_image]

  		respond_to :json, except: [:change_profile_image]

  		# GET
  		# =================================================
  		# =================================================
  		def index

        nl = plist
        nl << :ids

        new_params = params.permit nl
        new_params[:id] = new_params[:ids] if new_params[:ids].present?
        new_params.delete :ids

  			q = Tools.query(new_params)

        if new_params[:profile].present?
          @users = User.where(q)
          .joins("JOIN socials ON users.id = socials.user_id")
          .page(params[:page])
          .per((params[:limit] || 100).to_i)
          .order(params[:order])
        else
          new_params.delete :profile
          @users = User.where(q)
          .page(params[:page])
          .per((params[:limit] || 100).to_i)
          .order(params[:order])
        end

        puts '***---'*10
        puts q

  			respond_with @users,
        root: :users,
        meta: {
          current_page: @users.current_page,
          next_page: @users.next_page,
          prev_page: @users.prev_page,
          total_pages: @users.total_pages,
          total_count: @users.total_count,
          limit: (params[:limit] || 100).to_i
        }

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
        list = [:profile, :birthdate, :last_active, :promo_code, :floating, :author_id, :name, :email, :password, :password_confirmation, :gender, :birth_month, :birth_date, :birth_year, :phone, :address, :city, :state, :zip_code, :created_at, :updated_at]
        list << :access if current_user.access > 0
        list
      end

  	end
  end
end
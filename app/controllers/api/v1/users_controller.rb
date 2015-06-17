module Api
  module V1
    class UsersController < ApplicationController
      before_action :authenticate_user!
      before_action :set_user, except: :index
      respond_to :json

      def index
        @users = User.all
        respond_with @users
      end

      def show
        respond_with @user
      end

      def update
        if @user.update user_params
          @user.reload
          respond_to do |format|
            format.json {render json: @user, status: :ok, location: false}
          end
        else
          respond_with @user, status: :unprocessable_entity, location: false
        end
      end

      protected
      def user_params
        user_params = params.require(:user)
        user_params.delete :avatar if user_params[:avatar].blank?
        user_params.permit :email, :last_name, :first_name, :avatar, :birthday, :city, :country, :phone, :skype,
            :company_name, :job_title, :vk_link, :fb_link, :gplus_link, :ln_link, :tw_link
      end

      def set_user
        @user = User.find params[:id]
      end
    end
  end
end

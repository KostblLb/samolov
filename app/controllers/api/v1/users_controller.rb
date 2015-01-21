module Api
  module V1
    class UsersController < ApplicationController
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
          respond_with @user, status: :updated, location: false
        else
          respond_with @user, status: :unprocessable_entity, location: false
        end
      end

      protected
      def user_params
        params.require(:user).permit :email, :last_name, :first_name
      end

      def set_user
        @user = User.find params[:id]
      end
    end
  end
end

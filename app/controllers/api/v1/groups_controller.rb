module Api
  module V1
    class GroupsController < ApplicationController

      before_action :authenticate_user!
      respond_to :json

      def index
        @groups = scoped_collection
        respond_with @groups
      end

      def show
        @group = Group.find params[:id]
        respond_with @group
      end

      private
        def scoped_collection
          params[:scope] == 'as_teacher' ? current_user.trained_groups : current_user.groups
        end
    end
  end
end


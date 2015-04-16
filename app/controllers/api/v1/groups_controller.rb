module Api
  module V1
    class GroupsController < ApplicationController
      before_action :authenticate_user!
      before_action :set_group, except: :index
      respond_to :json

      def index
        @groups = scoped_collection
        respond_with @groups.entries
      end

      def show
        respond_with @group
      end

      def update
        authorize! :update, @group
        if @group.update group_params
          respond_with @group, status: :updated, location: false
        else
          respond_with @group, status: :unprocessable_entity, location: false
        end
      end

      private
        def scoped_collection
          params[:scope] == 'as_teacher' ? current_user.trained_groups : current_user.groups
        end

        def group_params
          # Hot ember fix
          params[:group][:scale_id] = params[:group][:scale] if params[:group][:scale_id].nil?
          params.require(:group).permit :scale_id
        end

        def set_group
          @group = Group.find params[:id]
        end
    end
  end
end


module Api
  module V1
    class GroupsController < ApplicationController
      respond_to :json

      def index
        @groups = Group.all
        respond_with @groups
      end

      def show
        @group =Group.find params[:id]
        respond_with(@group)
      end
    end
  end
end


module Api
  module V1
    class AdvertsController < ApplicationController
      respond_to :json

      def index
        group = Group.find params[:group_id]
        @adverts = group.adverts
        respond_with @adverts
      end
    end
  end
end
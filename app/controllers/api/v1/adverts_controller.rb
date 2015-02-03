module Api
  module V1
    class AdvertsController < ApplicationController
      before_action :set_group
      before_action :set_advert, only: [:show, :destroy]
      before_action :authenticate_user!

      respond_to :json

      def index
        authorize! :read_adverts, @group
        @adverts = @group.adverts
        respond_with @adverts
      end

      def show
        authorize! :read_adverts, @group
        respond_with @advert
      end

      def create
        authorize! :manage_adverts, @group
        @advert = @group.adverts.new advert_params
        if @advert.save
          respond_with @advert, status: :created, location: false
        else
          respond_with @advert, status: :unprocessable_entity, location: false
        end
      end

      def destroy
        authorize! :manage_adverts, @group
        @advert.destroy
        head :ok
      end

      private
      def advert_params
        params.require(:advert).permit :title, :text
      end

      def set_advert
        @advert = @group.adverts.find params[:id]
      end

      def set_group
        @group = Group.find params[:group_id]
      end
    end
  end
end
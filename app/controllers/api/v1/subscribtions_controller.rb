module Api
  module V1
    class SubscribtionsController < ApplicationController
      before_action :authenticate_user!

      respond_to :json

      def show
        @subscribtion = Subscribtion.find(params[:id])
        respond_with @subscribtion, root: 'subscribtion'
      end

      def update
        @subscribtion = Subscribtion.find(params[:id])
        if @subscribtion.update subscribtion_params
          respond_with @subscribtion, status: :updated, root: 'subscribtion'
        else
          respond_with @subscribtion, status: :unprocessable_entity, root: 'subscribtion'
        end
      end

      private

      def subscribtion_params
        params.require(:subscribtion).permit :new_message, :new_advert, :new_event, :module_start
      end

    end
  end
end

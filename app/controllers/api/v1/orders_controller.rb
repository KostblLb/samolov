module Api
  module V1
    class OrdersController < ApplicationController
      before_action :authenticate_user!
      respond_to :json

      def create
        @order = current_user.orders.new order_params
        if @order.save
          respond_with @order, statue: :created, location: false
        else
          respond_with @order, statue: :unprocessable_entity, location: false
        end
      end

      def show
        @order = current_user.orders.find params[:id]
        respond_with @order
      end

      private
      def order_params
        params.require(:order).permit :course_id
      end
    end
  end
end


module Api
  module V1
    class MessagesController < ApplicationController
      before_action :authenticate_user!
      before_action :set_conv
      before_action :set_msg, only: [:show, :destroy]
      respond_to :json

      def index
        @conversation.messages.paginate(:page => (params[:page] || 1), :per_page => 10)
        respond_with @message
      end

      def show
        respond_with @message
      end

      def create
        @conversation.messages.create(message_params)
        @message = @conversation.messages.last
        if @conversation.save
          respond_with @message, status: :created, location: false
        else
          respond_with @message, status: :unprocessable_entity
        end
      end

      def destroy
        @message.destroy
        head :ok
      end

      private
      def message_params
        for_current = params.require(:message).permit :body
        for_current[:sender] = current_user.id
        for_current
      end

      def set_msg
        @message = @conversation.messages.find(params[:id])
      end

      def set_conv
        @conversation = Conversation.find(params[:conversation_id])
      end
    end
  end
end

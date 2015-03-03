module Api
  module V1
    class MessagesController < ApplicationController
      before_action :authenticate_user!
      before_action :set_conv
      before_action :set_msg, only: [:show, :destroy]
      respond_to :json

      def show
        respond_with @message
      end

      def create
        @conversation.messages.create(message_params)
        @message = @conversation.messages.last
        if @conversation.save
          respond_with @conversation, status: :created, location: false
        else
          respond_with @conversation, status: :unprocessable_entity
        end
      end

      def destroy
        @message.destroy
        head :ok
      end

      private
      def message_params
        params.require(:message).permit :body, :sender, :conversation_id
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

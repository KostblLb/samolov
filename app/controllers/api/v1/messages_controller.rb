module Api
  module V1
    class MessagesController < ApplicationController
      before_action :authenticate_user!
      respond_to :json

      def index
        @messages = scoped_collection
        respond_with @messages
      end

      def show
        @message = Message.find(params[:id])
        respond_with @message
      end

      def create
        @message = current_user.outbox.new message_params
        if @message.save
          respond_with @message, status: :created, location: false
        else
          respond_with @message, status: :unprocessable_entity
        end
      end

      private
      def scoped_collection
        if params[:scope].in? %w(inbox outbox)
          current_user.send params[:scope]
        else
          raise CanCan::AccessDenied
        end
      end
      def message_params
        params.require(:message).permit :body, :recipient_id
      end
    end
  end
end

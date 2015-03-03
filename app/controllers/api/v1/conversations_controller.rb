module Api
  module V1
    class ConversationsController < ApplicationController
      before_action :authenticate_user!
      before_action :set_conv, only: [:update, :destroy, :show, :view]
      respond_to :json

      def create
        @conversation = Conversation.new (conversation_params)
        if @conversation.save
          respond_with @conversation, status: :created, location: false
        else
          respond_with @conversation, status: :unprocessable_entity
        end
      end

      def update
        if @conversation.update (conversation_params)
          respond_with @conversation
        end
      end

      def destroy
        @conversation.destroy
        respond_with @conversation
      end

      def index
        @conversation = Conversation.all
        respond_with @conversation
      end

      def show
        respond_with @conversation
      end

      def view
        @conversation.messages.each { |current_message| current_message.viewed_by(current_user)}
        respond_with @conversation
      end

      private
      def conversation_params
        params.require(:conversation).permit :subject, user_ids: [], messages_attributes: [:sender, :body]
      end

      def set_conv
        @conversation = Conversation.find(params[:id])
      end
    end
  end
end

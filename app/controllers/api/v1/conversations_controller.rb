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
        head :ok
      end

      def index
        @conversation = current_user.conversations.paginate(:page => (params[:page] || 1), :per_page => 15)
        respond_with @conversation, each_serializer: ConversationWithoutMessagesSerializer, serializer: PaginationSerializer
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
        params.require(:conversation)[:user_ids] = params.require(:conversation).delete(:users) if params.require(:conversation)[:users].present? && params.require(:conversation)[:users_ids].nil?
        for_current = params.require(:conversation).permit :subject, user_ids: [], messages: [:sender, :body]
        for_current[:user_ids].push(current_user.id) unless for_current[:user_ids].include?(current_user.id)
        if  for_current.has_key?(:messages)
          for_current[:messages][0][:sender_id] = current_user.id
        end
        for_current
      end

      def set_conv
        @conversation = Conversation.find(params[:id])
      end
    end
  end
end

module Api
  module V1
    class FaqsController < ApplicationController
      before_action :authenticate_user!
      respond_to :json

      def index
        @faq = Faq.all
        respond_with @faq
      end

      def show
        @faq = Faq.find params[:id]
        respond_with @faq
      end
    end
  end
end

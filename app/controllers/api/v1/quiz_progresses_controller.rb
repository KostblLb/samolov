module Api
  module V1
    class QuizProgressesController < ApplicationController

      before_action :authenticate_user!
      respond_to :json

      def show
        @quiz_progress = QuizProgress.find params[:id]
        respond_with @quiz_progress
      end
    end
  end
end


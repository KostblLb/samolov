module Api
  module V1
    class QuizProgressesController < ApplicationController

      before_action :authenticate_user!
      respond_to :json

      def index
        @quiz_progresses = QuizProgress.where :id.in => params[:ids]
        respond_with @quiz_progresses
      end

      def show
        @quiz_progress = QuizProgress.find params[:id]
        respond_with @quiz_progress
      end
    end
  end
end


module Api
  module V1
    class QuizController < ApplicationController
      respond_to :json

      def index
        quiz = Quiz.find params[:quiz_id]
        @quiz_progressess = quiz.quiz_progresses
        respond_with @quiz_progresses
      end

      def show
        @quiz_progress = QuizProgress.find params[:id]
        respond_with(@quiz_progress)
      end

      def update
        if @quiz_progress.update quiz_progress_params
          respond_with @quiz_progress, status: :updated
        else
          respond_with @quiz_progress, status: :some_error
        end
      end
    end
  end
end


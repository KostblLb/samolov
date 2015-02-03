module Api
  module V1
    class AnswersController < ApplicationController
      respond_to :json

      def index
        question = Question.find params[:question_id]
        @answers = question.answers
        respond_with @answers
      end

      def show
        @answer = Answer.find params[:id]
        respond_with(@answer)
      end
    end
  end
end
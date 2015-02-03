module Api
  module V1
    class QuestionsController < ApplicationController
      respond_to :json

      def index
        test = Test.find params[:test_id]
        @questions = test.questions
        respond_with @questions
      end

      def show
        @question = Question.find params[:id]
        respond_with(@question)
      end
    end
  end
end
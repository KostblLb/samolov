module Api
  module V1
    class UserAnswersController < ApplicationController
      respond_to :json

      def create
        @user_answer = @question.user_answer.new user_answer_params
      end
    end
  end
end
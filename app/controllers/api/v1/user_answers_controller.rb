module Api
  module V1
    class UserAnswersController < ApplicationController
      respond_to :json
      before_action :authenticate_user!

      def create
        question = Question.find params[:user_answer][:question_id]
        @user_answer = question.user_answers.new user_answer_params
        @user_answer.quiz_progress = QuizProgress.find_by(user: current_user, quiz: question.quiz)
        if @user_answer.save
          respond_with @user_answer, status: :created, location: false
        else
          respond_with @user_answer, status: :unprocessable_entity, location: false
        end
      end

      private
      def user_answer_params
        params.require(:user_answer).permit :answer_id
      end
    end
  end
end
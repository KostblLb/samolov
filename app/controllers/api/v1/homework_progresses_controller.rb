module Api
  module V1
    class HomeworkProgressesController < ApplicationController

      before_action :authenticate_user!
      respond_to :json

      def show
        @progress = Homework::Progress.find params[:id]
        respond_with(@progress)
      end

      def update
        if @progress.update homework_progress_params
          respond_with @progress, status: :updated
        else
          respond_with @progress, status: :some_error
        end
      end

      private
       def homework_progress_params
         params.require(Homework::Progress).permit progress_params [text_answers: :is_correct, text_answers: :comment,table_answers: :is_correct, table_answers: :comment,text_answers: :answer, table_answers: {rows:{row: []}}]
       end
    end
  end
end

module Api
  module V1
    class HomeworkProgressesController < ApplicationController

      before_action :authenticate_user!
      respond_to :json

      def show
        @homework_progress = Homework::Progress.find params[:id]
        respond_with @homework_progress, root: 'homework_progress'
      end

      def update
        if @homework_progress.update homework_progress_params
          respond_with @homework_progress, status: :updated, root: 'homework_progress'
        else
          respond_with @homework_progress, status: :some_error, root: 'homework_progress'
        end
      end

      private
       def homework_progress_params
         params.require(:homework_progress).permit progress_params [text_answers: :is_correct, text_answers: :comment,table_answers: :is_correct, table_answers: :comment,text_answers: :answer, table_answers: {rows:{row: []}}]
       end
    end
  end
end

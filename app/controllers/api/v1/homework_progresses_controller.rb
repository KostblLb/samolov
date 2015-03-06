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
        #@homework_progress = Homework::Progress.find params[:id]
        authorize! :update, @homework_progress
        if @homework_progress.update progress_params
          respond_with @homework_progress, status: :updated, root: 'homework_progress'
        else
          respond_with @homework_progress, status: :some_error, root: 'homework_progress'
        end
      end

      private
       def progress_params
         if @homework_progress.teacher == current_user
          result = params.require(:homework_progress).permit :state, tasks: [:id, :is_correct, :comment, :_type]
         else
           result = params.require(:homework_progress).permit :state, tasks: [:id, :_type, :answer, rows:[:id, :name, :colspan, cells:[]]]
         end
         result[:tasks_attributes] = result.delete(:tasks)
         result
       end
    end
  end
end

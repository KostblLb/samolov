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
        @homework_progress = Homework::Progress.find params[:id]
        if @homework_progress.update progress_params
          respond_with @homework_progress, status: :updated, root: 'homework_progress'
        else
          respond_with @homework_progress, status: :some_error, root: 'homework_progress'
        end
      end

      private
       def progress_params
         params.require(:homework_progress).permit  tasks:[:id, :description, :is_verified, :order, :is_correct, :_type, :answer, rows:[:id, :name, :colspan, cells:[]]]
       end
    end
  end
end

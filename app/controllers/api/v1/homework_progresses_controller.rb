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
        authorize! :update, @homework_progress
        if @homework_progress.update progress_params
          respond_with @homework_progress, status: :updated, root: 'homework_progress'
        else
          respond_with @homework_progress, status: :unprocessable_entity, root: 'homework_progress'
        end
      end

      private
       def progress_params
         if @homework_progress.teacher == current_user
          result = params.require(:homework_progress).permit :state_event, tasks: [:id, :is_correct, :comment]
         else
           result = params.require(:homework_progress).permit :state_event, tasks: [:id, subtasks: [:id, :_type, :answer, :fish_body, :fish_head,
                                  profile_compulsory: [:id, :sex, :age, :appearance, :other_physical, :education_level, :specialization, :additional_training,
                                                       :languages, :work_experience, :additional_requirements, :money, :image, :security, :physical_ease,
                                                       :psychological_ease, :self_cultivation, :additional_requirements_company],
                                  profile_desirable: [:id, :sex, :age, :appearance, :other_physical, :education_level, :specialization, :additional_training,
                                                      :languages, :work_experience, :additional_requirements, :money, :image, :security, :physical_ease,
                                                      :psychological_ease, :self_cultivation, :additional_requirements_company],
                                  answers: [],
                                  rows:[ :id , cells:[]], lines:[]]]
         end
         result[:tasks].each do |task|
           if  task.has_key?(:subtasks)
             task[:subtasks].each do |subtask|
                if subtask.has_key?(:rows)
                  subtask[:rows_attributes]=subtask.delete(:rows)
                end
                if subtask.has_key?(:answers)
                  subtask[:answer_ids]=subtask.delete(:answers)
                end
             end
             task[:subtasks_attributes] = task.delete(:subtasks)
           end
         end
         result[:tasks_attributes] = result.delete(:tasks)
         result
       end
    end
  end
end

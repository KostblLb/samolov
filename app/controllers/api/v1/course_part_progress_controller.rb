module Api
  module V1
    class CoursePartProgressesController < ApplicationController
      respond_to :json

      def index
        part = Part.find params[:part_id]
        @course_part_progressess = part.course_part_progresses
        respond_with @course_part_progresses
      end

      def show
        @course_part_progress = CoursePartProgress.find params[:id]
        respond_with(@course_part_progress)
      end

      def update
        if @course_part_progress.update course_part_progress_params
          respond_with @course_part_progress, status: :updated
        else
          respond_with @course_part_progress, status: :some_error
        end
      end
    end
  end
end


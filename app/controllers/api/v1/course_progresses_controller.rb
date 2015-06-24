module Api
  module V1
    class CourseProgressesController < ApplicationController
      respond_to :json

      def index
        if params[:ids].present?
          @course_progresses = CourseProgress.where :id.in => params[:ids]
        else
          course = Course.find params[:course_id]
          @course_progresses = course.course_progresses
        end
        respond_with @course_progresses
      end

      def show
        @course_progress = CourseProgress.find params[:id]
        respond_with(@course_progress)
      end

      def update
        if @course_progress.update course_progress_params
          respond_with @course_progress, status: :updated
        else
          respond_with @course_progress, status: :some_error
        end
      end
    end
  end
end


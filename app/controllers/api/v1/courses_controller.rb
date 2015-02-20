module Api@homework_progress
  module V1
    class CoursesController < ApplicationController
      respond_to :json

      def index
        @courses = Course.all
        respond_with @courses
      end

      def show
        @course = Course.find params[:id]
        respond_with(@course)
      end
    end
  end
end


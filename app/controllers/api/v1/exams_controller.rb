module Api
  module V1
    class ExamsController < ApplicationController
      respond_to :json

      def index
        unit = Unit.find params[:unit_id]
        @exams = unit.exams
        respond_with @exams
      end

      def show
        @exam = Exam.find params[:id]
        respond_with(@exam)
      end
    end
  end
end
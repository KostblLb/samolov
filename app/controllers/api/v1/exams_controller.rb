module Api
  module V1
    class ExamsController < ApplicationController
      respond_to :json

      def index
        unit = Unit.find params[:unit_id]
        @first_exam = unit.first_test
        @second_exam = unit.second_test
        respond_with(@first_exam, @second_exam )
      end

      def show
        @exam = Exam.find params[:id]
        respond_with(@exam)
      end
    end
  end
end
module Api
  module V1
    class UnitProgressesController < ApplicationController
      respond_to :json

      def index
        unit = Unit.find params[:unit_id]
        @unit_progressess = unit.unit_progresses
        respond_with @unit_progresses
      end

      def show
        @unit_progress = UnitProgress.find params[:id]
        respond_with(@unit_progress)
      end

      def update
        if @unit_progress.update unit_progress_params
          respond_with @unit_progress, status: :updated
        else
          respond_with @unit_progress, status: :some_error
        end
      end
    end
  end
end


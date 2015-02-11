module Api
  module V1
    class UnitProgressesController < ApplicationController
      respond_to :json
      before_action :set_unit_progress

      def show
        respond_with(@unit_progress)
      end

      def update
         @unit_progress.update unit_progress_params
         respond_with @unit_progress
      end
      private
        def unit_progress_params
          params.require(:unit_progress).permit :state
        end

        def set_unit_progress
          @unit_progress = UnitProgress.find params[:id]
        end
    end
  end
end


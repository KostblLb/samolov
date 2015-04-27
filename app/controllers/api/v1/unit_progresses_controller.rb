module Api
  module V1
    class UnitProgressesController < ApplicationController
      respond_to :json
      before_action :set_unit_progress

      def show
        respond_with(@unit_progress)
      end

      def update
        @unit_progress
        if @unit_progress.update unit_progress_params
          @unit_progress.reload
          respond_to do |format|
            format.json {render json: @unit_progress, status: :ok, location: false}
          end
        else
          respond_with @unit_progress, status: :unprocessable_entity, location: false
        end
      end
      private
        def unit_progress_params
          if @unit_progress.teacher == current_user
            params.require(:unit_progress).permit :webinar_score
          else
            params.require(:unit_progress).permit :video_complete, :summary_complete, :webinar_complete

          end
        end

        def set_unit_progress
          @unit_progress = UnitProgress.find params[:id]
        end
    end
  end
end


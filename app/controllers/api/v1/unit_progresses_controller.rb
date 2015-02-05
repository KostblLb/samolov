module Api
  module V1
    class UnitsController < ApplicationController
      respond_to :json

      def index
        part = Part.find params[:part_id]
        @units = part.units
        respond_with @units
      end

      def show
        @unit = Unit.find params[:id]
        respond_with(@unit)
      end
    end
  end
end


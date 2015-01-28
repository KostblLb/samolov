module Api
  module V1
    class PartsController < ApplicationController
      respond_to :json

      def index
        @parts = Part.all
        respond_with @parts
      end

      def show
        @part = Part.find params[:id]
        respond_with(@part)
      end
    end
  end
end


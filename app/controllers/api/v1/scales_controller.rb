module Api
  module V1
    class ScalesController < ApplicationController
      before_action :set_scale, only: [:show, :edit, :update, :destroy]

      respond_to :json

      def index
        @scales = Scale.all
        respond_with @scales
      end

      def show
        respond_with @scale
      end

      def create
        @scale = Scale.new scale_params
        if @scale.save
          respond_with @scale, status: :created, location: false
        else
          respond_with @scale, status: :unprocessable_entity, location: false
        end
      end

      def update
        if @scale.update scale_params
          respond_with @scale, status: :created, location: false
        else
          respond_with @scale, status: :unprocessable_entity, location: false
        end
    end

      def destroy
        @scale.destroy
        head :ok
      end

      private
      def set_scale
        @scale = Scale.find params[:id]
      end

      def scale_params
        params.require(:scale).permit :name, sections: [:from, :to, :points]
      end
    end
  end
end

module Api
  module V1
    class QuizsController < ApplicationController
      respond_to :json
      
      def show
        @quiz = Quiz.find params[:id]
        respond_with(@quiz)
      end
    end
  end
end
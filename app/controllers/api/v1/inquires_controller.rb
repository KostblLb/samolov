module Api
  module V1
    class InquiresController < ApplicationController
      respond_to :json

      def create
        @inquire = Inquire.new(inquire_params)
        if @inquire.save
          InquireMailer.send_mail('Новая заявка',@inquire).deliver
          respond_with @inquire, status: :created, location: false
        else
          respond_with @inquire, status: :unprocessable_entity
        end
      end

      private
      def inquire_params
        params.require(:inquire).permit :name, :phone, :email
      end
    end
  end
end

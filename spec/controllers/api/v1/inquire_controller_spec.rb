require 'rails_helper'

RSpec.describe Api::V1::InquiresController, :type => :controller do

  before :each do
    request.accept = 'application/json'
  end

  describe "POST create" do
    let(:valid_attributes) { {name: 'Ivan', phone: '123', email: 'qwe@qwe.qwe'} }
    subject { post :create, {inquire: valid_attributes} }
    it 'create a new inquire' do
      expect{subject}.to change {Inquire.count}.by(1)
    end
  end

end

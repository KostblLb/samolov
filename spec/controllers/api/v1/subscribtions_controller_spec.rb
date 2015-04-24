require 'rails_helper'

RSpec.describe Api::V1::SubscribtionsController, type: :controller do

  let (:user){create :user}
  before(:each) {sign_in(user)}

  before :each do
    request.accept = 'application/json'
  end

  describe "GET show" do
    let(:subscribtion) {user.subscribtion}
    it "assigns the requested unit as @unit" do
      get :show, {:id => subscribtion.to_param}
      expect(assigns(:subscribtion)).to eq(subscribtion)
    end
  end

  describe 'PUT update' do
    let(:subscribtion) {user.subscribtion}
    subject{put :update, id: subscribtion.id, subscribtion:{new_message: false, new_advert: true, new_event: false, module_start: true}}
    it 'updates subscribtion' do
      subject
      expect(subscribtion.reload.new_message).to eq(false)
    end
  end
end

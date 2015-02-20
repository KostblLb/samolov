require 'rails_helper'

RSpec.describe Api::V1::ScalesController, :type => :controller do

  let(:scale) {create :scale}
  let(:group) {create :group, scale: scale}
  let(:user)  {create :user}

  before :each do
    request.accept = 'application/json'
    sign_in user
  end

  describe "GET index" do
    it 'assigns all scales as @scales' do
      get :index
      expect(assigns(:scales)).to eq([scale])
    end
  end

  describe "GET show" do
    it "assigns the requested scale as @scale" do
      get :show, {id: scale.to_param}
      expect(assigns(:scale)).to eq(scale)
    end
  end

  describe 'POST create' do
    let(:attributes) {{name: 'new'}}
    it 'creates a new scales' do
      expect{post :create, scale: attributes}.to change{Scale.count}.by(1)
    end
  end
end

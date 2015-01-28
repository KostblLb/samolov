require 'rails_helper'

RSpec.describe Api::V1::GroupsController, type: :controller do

  let(:group) {create :group}

  before :each do
    request.accept = 'application/json'
  end

  describe "GET index" do
    it "assigns all groups as @groups" do
      get :index
      expect(assigns(:groups)).to eq([group])
    end
  end

  describe "GET show" do
    it "assigns the requested group as @group" do
      get :show, {:id => group.to_param}
      expect(assigns(:group)).to eq(group)
    end
  end
end

require 'rails_helper'

RSpec.describe AboutController, :type => :controller do

  describe "GET samolov" do
    it "returns http success" do
      get :samolov
      expect(response).to be_success
    end
  end

  describe "GET founders" do
    it "returns http success" do
      get :founders
      expect(response).to be_success
    end
  end

  describe "GET history" do
    it "returns http success" do
      get :history
      expect(response).to be_success
    end
  end

end

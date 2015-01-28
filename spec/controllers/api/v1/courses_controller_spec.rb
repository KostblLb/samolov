require 'rails_helper'

RSpec.describe Api::V1::CoursesController, type: :controller do

  let(:course) {create :course}

  before :each do
    request.accept = 'application/json'
  end

  describe "GET index" do
    it "assigns all api_v1_courses as @courses" do
      get :index
      expect(assigns(:courses)).to eq([course])
    end
  end

  describe "GET show" do
    it "assigns the requested api_v1 as @course" do
      get :show, {:id => course.to_param}
      expect(assigns(:course)).to eq(course)
    end
  end


end

require 'rails_helper'

RSpec.describe Api::V1::PartsController, type: :controller do

  let(:course) {create :empty_course}
  let(:part) { course.parts.first }

  before :each do
    request.accept = 'application/json'
  end

  describe "GET index" do
    it "assigns all parts of coourse as @parts" do
      get :index, course_id: part.course.to_param
      expect(assigns(:parts)).to eq(part.course.parts)
    end
  end

  describe "GET show" do
    it "assigns the requested part as @part" do
      get :show, {:id => part.to_param}
      expect(assigns(:part)).to eq(part)
    end
  end


end

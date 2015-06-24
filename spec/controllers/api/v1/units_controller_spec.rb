require 'rails_helper'

RSpec.describe Api::V1::UnitsController, type: :controller do

  let(:course) {create :empty_course}
  let(:part) { course.parts.first }
  let(:unit) { part.units.first }

  before :each do
    request.accept = 'application/json'
  end

  describe "GET index" do
    it "assigns all part's units as @units" do
      get :index, part_id: part.to_param
      expect(assigns(:units)).to eq(unit.part.units)
    end
  end

  describe "GET show" do
    it "assigns the requested unit as @unit" do
      get :show, {:id => unit.to_param}
      expect(assigns(:unit)).to eq(unit)
    end
  end
end

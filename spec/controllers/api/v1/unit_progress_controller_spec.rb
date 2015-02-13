require 'rails_helper'

RSpec.describe Api::V1::UnitProgressesController, :type => :controller do
  let(:unit_progress){create :unit_progress}
  before :each do
    request.accept = 'application/json'
  end

  describe 'PUT update' do
    subject{put :update, id: unit_progress.id, unit_progress: {state: "quiz"}}

    it 'updates state' do
      expect{subject}.to change{unit_progress.reload.state}.to("quiz")
    end
  end
end
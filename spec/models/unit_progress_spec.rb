require 'rails_helper'

RSpec.describe UnitProgress do
  describe 'create new object' do
    subject{FactoryGirl.create :unit_progress}
    before(:each) {subject.save}
    it 'creates parts progresses' do
      expect(subject.quiz_progress)
      expect(subject.case_progress)
      end

    it 'next step' do
      expect(subject.state).to eq("video")
      subject.next_step
      expect(subject.state).to eq("quiz")
    end
  end
end
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
      expect(subject.current_step).to eq("1")
      subject.next_step
      expect(subject.current_step).to eq("2")
    end
  end

  describe '#max_points' do
    let(:progress) {FactoryGirl.create :unit_progress}

    it 'returns sum of max points quiz and case' do
      expect(progress.max_points).to eq(progress.quiz_progress.max_points + progress.case_progress.max_points)
    end
  end
end
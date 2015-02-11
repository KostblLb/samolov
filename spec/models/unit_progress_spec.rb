require 'rails_helper'

RSpec.describe UnitProgress do
  describe 'create new object' do
    subject{FactoryGirl.create :unit_progress}
    before(:each) {subject.save}
    it 'creates parts progresses' do
      expect(subject.quiz_progress)
      expect(subject.case_progress)
    end
  end

  describe '#max_points' do
    let(:progress) {FactoryGirl.create :unit_progress}

    it 'returns sum of max points quiz and case' do
      expect(progress.max_points).to eq(progress.quiz_progress.max_points + progress.case_progress.max_points)
    end
  end

  describe '#points' do
    let(:progress) {FactoryGirl.create :unit_progress}
    subject {progress.points}

    it {is_expected.to eq(progress.quiz_progress.points + progress.case_progress.points)}
  end
end
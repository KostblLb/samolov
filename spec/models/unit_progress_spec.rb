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

  describe 'next step' do
    subject{FactoryGirl.create :unit_progress}
    before(:each) {subject.save}
    it 'does step' do
      expect(subject.state).to eq("video")
      subject.next_step
      expect(subject.state).to eq("quiz")
    end
  end
  describe '#max_points' do
    subject {progress.max_points}
    context 'unit is not exam' do
      let(:progress) {create :unit_progress}
      it {is_expected.to eq(progress.quiz_progress.max_points + progress.case_progress.max_points)}
    end

    context 'unit is exam' do
      let(:progress) {create :unit_progress, unit: create(:exam)}
      it {is_expected.to eq(2 * (progress.quiz_progress.max_points + progress.case_progress.max_points))}
    end
  end

  describe '#points' do
    subject {progress.points}
    context 'unit is not exam' do
      let(:progress) {create :unit_progress}
      it {is_expected.to eq(progress.quiz_progress.points + progress.case_progress.points)}
    end
    context 'unit is exam' do
      let(:progress) {create :unit_progress, unit: create(:exam)}
      it {is_expected.to eq(2 * (progress.quiz_progress.points + progress.case_progress.points))}
    end
  end

  describe 'step after last question' do
    subject{FactoryGirl.create :unit_progress, state: 'quiz', quiz_progress:(create :quiz_progress, current_question: nil)}

    it 'does step after last question' do
      FactoryGirl.create :user_answer, quiz_progress: subject.quiz_progress
      FactoryGirl.create :user_answer, quiz_progress: subject.quiz_progress
      expect(subject.state).to eq("summary")
    end
  end

end
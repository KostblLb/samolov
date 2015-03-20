require 'rails_helper'

RSpec.describe UnitProgress do
  describe 'create new object' do
    subject{FactoryGirl.create :unit_progress}

    before(:each) {subject.save}
    it 'creates parts progresses' do
      expect(subject.quiz_progress)
      expect(subject.case_progress)
    end

    context 'create exam' do
      subject{create :unit_progress, unit: create(:exam)}
      it 'has state equals case' do
        expect(subject.case?).to be_truthy
      end
    end
  end

  describe 'next step' do
    subject{FactoryGirl.create :unit_progress}
    before(:each) {subject.save}
    it 'does step' do
      expect(subject.state).to eq("disabled")
      subject.next_step
      expect(subject.state).to eq("video")
    end
  end
  describe '#max_points' do
    subject {progress.max_points}
    context 'unit is not exam' do
      let(:progress) {create :unit_progress}
      it {is_expected.to eq(progress.quiz_progress.max_points + progress.case_progress.max_points + progress.homework_progress.max_points + 5)}
    end

    context 'unit is exam' do
      let(:progress) {create :unit_progress, unit: create(:exam)}
      it {is_expected.to eq(progress.quiz_progress.max_points + progress.case_progress.max_points + progress.homework_progress.max_points + 15)}
    end
  end

  describe '#max_webinar_points' do
    subject{progress.max_webinar_points}

    context 'unit is exam' do
      let(:progress) {create :unit_progress, unit: (create :exam)}
      it{is_expected.to eq 15}
    end

    context 'unit is not exam' do
      let(:progress) {create :unit_progress, unit: (create :unit)}
      it{is_expected.to eq 5}
    end
  end

  describe '#points' do
    subject {progress.points}
    context 'unit is not exam' do
      let(:progress) {create :unit_progress}
      it {is_expected.to eq(progress.quiz_progress.points + progress.case_progress.points + progress.webinar_score)}
    end
    context 'unit is exam' do
      let(:progress) {create :unit_progress, unit: create(:exam)}
      it {is_expected.to eq(progress.quiz_progress.points + progress.case_progress.points + progress.webinar_score)}
    end
  end
end
require 'rails_helper'

RSpec.describe Homework::Progress do
  let (:homework_progress) {create :homework_progress, unit_progress: create(:unit_progress)}


  describe '#total_tasks' do
    subject {homework_progress.total_tasks}
    it {is_expected.to eq(3)}
  end

  describe '#max_points' do
    subject {homework_progress.max_points}
    it {is_expected.to eq(10)}
  end

  describe '#correct_answer_counter' do
    subject {homework_progress.correct_answer_counter}
    it {is_expected.to eq(3)}
  end

  describe '#mistakes_count' do
    subject {homework_progress.mistakes_count}
    it {is_expected.to eq(0)}
  end

  context 'homework is not complete' do
    describe '#points' do
      subject {homework_progress.points}
      it {is_expected.to eq(0)}
    end
  end

  context 'homework is complete' do
    before(:each) do
      homework_progress.state = :verified
    end
    describe '#points' do
      subject {homework_progress.points}
      it {is_expected.to eq(5)}
    end
  end
end
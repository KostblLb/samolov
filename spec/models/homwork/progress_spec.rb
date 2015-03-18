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

  describe '#mistakes_counter' do
    subject {homework_progress.mistakes_counter}
    it {is_expected.to eq(0)}
  end

  describe '#points' do
    subject {homework_progress.points}

    context 'homework is not complete' do
      it {is_expected.to eq(0)}
    end

    context 'homework is not complete' do
      before(:each) {homework_progress.state = :verified}
      it {is_expected.to eq(5)}
    end

  end
end
require 'rails_helper'

RSpec.describe Homework::Progress do
  before(:each) {subject.save}
  describe 'create new object' do
    subject {FactoryGirl.create :homework_progress}
    it 'points counters' do
      subject.tasks.first.is_correct = true
      expect(subject.max_points).to eq(10)
      expect(subject.correct_answer_counter).to eq(1)
      expect(subject.mistakes_counter).to eq(1)
      expect(subject.points).to eq(5)
    end
  end
end
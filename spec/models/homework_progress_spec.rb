require 'rails_helper'

RSpec.describe Homework::Progress do
  before(:each) {subject.save}
  describe 'create new object' do
   # let(:meta_tasks){ build homework_meta.meta_tasks task_class: "TextField"}

    subject {FactoryGirl.create :progress}

    it 'creates homework' do
      expect(subject.homework_meta)
      expect(subject.homework_meta.meta_tasks.size).to eq(2)
      expect(subject.text_answers.size).to eq(2)
    end
  describe 'set answer as correct' do
    subject{FactoryGirl.create :progress}
    it 'points counters' do
      subject.text_answers.first.is_correct = true
      expect(subject.max_points).to eq(10)
      expect(subject.correct_answer_counter).to eq(1)
      expect(subject.mistakes_counter).to eq(1)
      expect(subject.points).to eq(5)
    end

  end

  end
end
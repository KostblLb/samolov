require 'rails_helper'

RSpec.describe Homework::Progress do

  let(:course) {create :empty_course}
  let(:teacher) {create :user}
  let(:student) {create :user}
  let(:group) {create :group, teacher: teacher, students: [student], course: course}
  let(:course_progress) {group.course_progresses.first}
  let(:course_part_progress) {course_progress.course_part_progresses.first}
  let(:unit_progress) { course_part_progress.unit_progresses.first }

  let (:homework_progress) {create :homework_progress, unit_progress: unit_progress}

  describe '#total_tasks' do
    subject {homework_progress.total_tasks}
    it {is_expected.to eq(3)}
  end

  describe '#max_points' do
    subject {homework_progress.max_points}
    context 'unit is exam' do
      let(:unit){create :exam}
      it{is_expected.to eq(10)}
    end
    context 'unit is not exam' do
      let(:unit){create :unit}
      it{is_expected.to eq(10)}
    end
  end

  describe '#correct_answer_counter' do
    subject {homework_progress.correct_answer_counter}
    it {is_expected.to eq(3)}
  end

  describe '#mistakes_count' do
    subject {homework_progress.mistakes_count}
    it {is_expected.to eq(0)}
  end

  describe '#points' do
    subject {homework_progress.points}

    context 'homework is not complete' do
      it {is_expected.to eq(0)}
    end

    context 'homework is complete' do
      before(:each) {homework_progress.state = :verified}
      context 'unit is exam' do
        let(:unit){create :exam}
        it{is_expected.to eq(10)}
      end
      context 'unit is not exam' do
        let(:unit){create :unit}
        it{is_expected.to eq(10)}
      end
    end
  end

  describe '#verify' do
    before(:each) do
      homework_progress.complete
      homework_progress.verify
    end
    it { expect(homework_progress.state).to eq('verified') }
  end
end
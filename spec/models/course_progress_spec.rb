require 'rails_helper'

RSpec.describe CourseProgress do
  describe 'create new object' do
    before(:each) {subject.save}
    subject{create :course_progress}

    it 'creates parts progresses' do
      expect(subject.course_part_progresses.count).to eq(2)
    end
  end

  describe '#max_points' do
    let(:progress) {create :course_progress}
    subject{progress.max_points}

    it {is_expected.to eq(progress.course_part_progresses.inject(0) {|sum, p| sum + p.max_points})}
  end
  describe '#points' do
    let(:progress) {create :course_progress}
    subject{progress.points}

    it {is_expected.to eq(progress.course_part_progresses.inject(0) {|sum, p| sum + p.points})}
  end

  describe '#next_unit_progress(position)' do
    let(:course_progress) {create :course_progress}
    context 'next unit progress exist' do
      it { expect(course_progress.next_part_progress(1)).to eq(course_progress.course_part_progresses.first) }
    end
    context 'next unit progress not exist' do
      it { expect(course_progress.next_part_progress(2)).to be_nil }
    end
  end


  describe '#resolve_state(position)' do
    let(:course_progress) {create :course_progress}
    context 'next unit progress exist' do
      it { expect(course_progress.resolve_state(1).state).to eq('in_progress') }
    end
    context 'next unit progress not exist' do
      before(:each) {course_progress.resolve_state(2)}
      it { expect(course_progress.is_complete).to be_truthy }
    end
  end
end
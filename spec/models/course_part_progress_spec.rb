require 'rails_helper'

RSpec.describe CoursePartProgress do
  describe 'create new object' do
    before(:each) {subject.save}
    subject{create :course_part_progress}

    it 'creates unit progresses' do
      expect(subject.unit_progresses.count).to eq(2)
    end
  end

  describe '#next_unit_progress(position)' do
    let(:course_part_progress) {create :course_part_progress}
    context 'next unit progress exist' do
      it { expect(course_part_progress.next_unit_progress(1)).to eq(course_part_progress.unit_progresses.first) }
    end
    context 'next unit progress not exist' do
      it { expect(course_part_progress.next_unit_progress(2)).to be_nil }
    end
  end


  describe '#resolve_state(position)' do
    let(:course_part_progress) {create :course_part_progress}
    before(:each) {course_part_progress.state = 'in_progress'}
    context 'next unit progress exist' do
      it { expect(course_part_progress.resolve_state(1).state).to eq('video') }
    end
    context 'next unit progress not exist' do
      before(:each) {course_part_progress.resolve_state(2)}
      it { expect(course_part_progress.state).to eq('done') }
    end
  end
end
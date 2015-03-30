require 'rails_helper'

RSpec.describe CourseProgress do
  let(:course) {create :empty_course}
  let(:teacher) {create :user}
  let(:student) {create :user}
  let(:group) {create :group, teacher: teacher, students: [student], course: course}
  let(:course_progress) {group.course_progresses.first}
  let(:course_part_progress_first) {course_progress.course_part_progresses.first}
  let(:course_part_progress_last) {course_progress.course_part_progresses.last}

  describe '#resolve_state(course_part_progress)' do
    context 'next part progress exist' do
      subject{course_progress.resolve_state(course_part_progress_first)}
      it {expect{subject}.to change{course_part_progress_last.reload.state}.from('disabled').to('in_progress')}
    end
    context 'next part progress not exist' do
      subject{course_progress.resolve_state(course_part_progress_last)}
      it {expect{subject}.to change{course_progress.is_complete}.from(false).to(true)}
    end
  end

  describe 'create new object' do
    it 'creates parts progresses' do
      expect(course_progress.course_part_progresses.count).to eq(2)
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

  describe '#next_part_progress(course_part_progress)' do
    context 'next part progress exist' do
      it { expect(course_progress.next_part_progress(course_part_progress_first)).to eq(course_part_progress_last) }
    end

    context 'next part progress not exist' do
      it { expect(course_progress.next_part_progress(course_part_progress_last)).to be_nil }
    end
  end

  describe '#rebuild!' do
    before(:each) {group.course.parts << build(:empty_part)}
    subject {student.course_progresses.first.rebuild!}

    it { expect{subject}.to change{student.course_part_progresses.count}.from(2).to(3) }
    it { expect{subject}.to change{student.unit_progresses.count}.from(4).to(6) }
    it { expect{subject}.not_to change{student.course_part_progresses.first}}
    it { expect{subject}.not_to change{student.unit_progresses.first}}
  end
end
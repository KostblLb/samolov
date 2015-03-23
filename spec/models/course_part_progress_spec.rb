require 'rails_helper'

RSpec.describe CoursePartProgress do
  describe 'create new object' do
    before(:each) {subject.save}
    subject{create :course_part_progress}

    it 'creates unit progresses' do
      expect(subject.unit_progresses.count).to eq(2)
    end
  end

  let(:course) {create :empty_course, parts: [build(:empty_part, units: [build(:empty_unit, position: 1),
                                                                         build(:empty_unit, position: 2)], position: 1),
                                              build(:empty_part, units: [build(:empty_unit, position: 1),
                                                                         build(:empty_unit, position: 2)], position: 2)]}
  let(:teacher) {create :user}
  let(:student) {create :user}
  let(:group) {create :group, teacher: teacher, students: [student], course: course}
  let(:course_progress) {group.course_progresses.first}
  let(:course_part_progress_first) {course_progress.course_part_progresses.first}
  let(:unit_progress_first) {course_part_progress_first.unit_progresses.first}
  let(:unit_progress_last) {course_part_progress_first.unit_progresses.last}

  describe '#next_unit_progress(unit_progress)' do
    context ' next unit progress exist' do
      it { expect(course_part_progress_first.next_unit_progress(unit_progress_first)).to eq(unit_progress_last) }
    end

    context 'next unit progress not exist' do
      it { expect(course_part_progress_first.next_unit_progress(unit_progress_last)).to be_nil }
    end
  end

  describe '#resolve_state(unit_progress)' do
    context 'next unit progress exist' do
      subject{course_part_progress_first.resolve_state(unit_progress_first)}
      it {expect{subject}.to change{unit_progress_last.reload.state}.from('disabled').to('video')}
    end
    context 'next unit progress not exist' do
      before(:each) {course_part_progress_first.state = 'in_progress'}
      subject{course_part_progress_first.resolve_state(unit_progress_last)}
      it {expect{subject}.to change{course_part_progress_first.state}.from('in_progress').to('done')}
    end
  end

  describe '#rebuild!' do
    let(:course) {create :empty_course}
    let(:teacher) {create :user}
    let(:student) {create :user}
    let(:group) {create :group, teacher: teacher, students: [student], course: course}
    before(:each) {group.course.parts.first.units << build(:empty_unit)}
    subject {student.course_part_progresses.first.rebuild!}

    it { expect{subject}.to change{student.unit_progresses.count}.from(4).to(5) }
    it { expect{subject}.to change{student.quiz_progresses.count}.from(8).to(10) }
    # it { expect{subject}.to change{student.my_homeworks.count}.from(4).to(5) }
    it { expect{subject}.not_to change{student.unit_progresses.first}}
  end
end
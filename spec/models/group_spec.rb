require 'rails_helper'

RSpec.describe Group do

  let(:course) {create :empty_course}
  let(:teacher) {create :user}
  let(:student) {create :user}

  describe '#cannot_be_a_student?' do
    let(:group) { build :group, teacher: teacher, students: [student], course: course }
    context 'teacher is not student' do
      it {expect(group).to be_valid}
    end
    context 'teacher is student' do
      let(:student) { teacher }
      it 'cannot be a student' do
        group.valid?
        expect(group.errors[:teacher].size).to eq 1
      end
    end
  end

  describe 'after_add_user' do
    let(:new_student) {create :user}
    let(:group) {create :group, teacher: teacher, students: [student], course: course}
    subject {group.students << new_student}
    it { expect{subject}.to change{new_student.course_progresses.count}.from(0).to(1) }
    it { expect{subject}.to change{new_student.course_part_progresses.count}.from(0).to(2) }
    it { expect{subject}.to change{new_student.unit_progresses.count}.from(0).to(4) }
  end

  describe '#set_schedule' do
    let(:group) {create :group, teacher: teacher, students: [student], course: course}
    it {expect(group.unit_schedules.count).to eq(4)}
    it {expect(group.unit_schedules.last.start_date).to eq(Date.new(2015,1,22))}
    it {expect(group.unit_schedules.last.end_date).to eq(Date.new(2015,1,29))}
  end

  describe '#rebuild!' do
  end

  describe 'after create' do
    let(:group) {create :group, teacher: teacher, students: [student], course: course}
    it do
      expect(group.unit_schedules.first.webinar).to be_a(Webinar)
    end
  end
end

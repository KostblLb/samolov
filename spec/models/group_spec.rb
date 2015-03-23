require 'rails_helper'

RSpec.describe Group, :type => :model do

  describe '#cannot_be_a_student?' do

    let(:group) {build :group, teacher: teacher, students: [user]}
    let(:user) {create :user}
    let(:teacher) {create :user}

    context 'teacher is not student' do
      it {expect(group).to be_valid}
    end
    context 'teacher is student' do
      let(:teacher) {user}
      it {expect(group).to be_invalid}
    end
  end

  describe 'after_add_user' do
    let(:course) {create :empty_course}
    let(:teacher) {create :user}
    let(:student) {create :user}
    let(:new_student) {create :user}
    let(:group) {create :group, teacher: teacher, students: [student], course: course}

    subject {group.students << new_student}

    it { expect{subject}.to change{new_student.course_progresses.count}.from(0).to(1) }
    it { expect{subject}.to change{new_student.course_part_progresses.count}.from(0).to(2) }
    it { expect{subject}.to change{new_student.unit_progresses.count}.from(0).to(4) }
  end
end

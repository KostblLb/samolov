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

  describe '#rebuild!' do
    let(:course) {create :empty_course}
    let(:teacher) {create :user}
    let(:student) {create :user}
    let(:new_student) {create :user}
    let(:group) {create :group, teacher: teacher, students: [student], course: course}

    before(:each) {group.students << new_student}
    subject {group.rebuild!}

    it 'add course progress for new_student' do
      # expect{subject}.to change{new_student.course_progresses.count}.from(0).to(1)
    end

  end

end

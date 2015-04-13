require 'rails_helper'

RSpec.describe CourseProgress do
  let(:group) {create :group, teacher: (create :user), students: [(create :user)], course: (create :empty_course)}
  let(:course_progress) {group.course_progresses.first}

  describe 'create new object' do
    it 'creates parts progresses' do
      expect(course_progress.course_part_progresses.count).to eq(2)
    end
  end

  describe '#max_points' do
    subject{course_progress.max_points}

    it {is_expected.to eq(course_progress.course_part_progresses.inject(0) {|sum, p| sum + p.max_points})}
  end
  describe '#points' do
    subject{course_progress.points}

    it {is_expected.to eq(course_progress.course_part_progresses.inject(0) {|sum, p| sum + p.points})}
  end

  # describe '#course_beginning' do
  #   it { expect(course_progress.course_beginning).to eq(Date.new(2015,1,1)) }
  # end
  #
  # describe 'deadline' do
  #   it { expect(course_progress.deadline).to eq(Date.new(2015,1,25)) }
  # end
  #
  # describe '#rebuild!' do
  #   subject { course_progress.rebuild! }
  #   before(:each) { group.course.parts << build(:empty_part)}
  #   it { expect{subject}.to change{course_progress.course_part_progresses.count}.from(2).to(3)}
  # end
end
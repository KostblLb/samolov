require 'rails_helper'

RSpec.describe CoursePartProgress do
  let(:group) {create :group, teacher: (create :user), students: [(create :user)], course: (create :empty_course)}
  let(:course_progress) { group.course_progresses.first }
  let(:course_part_progress) { course_progress.course_part_progresses.first }

  describe 'create part_progress' do
    it {expect(course_part_progress.unit_progresses.count).to eq(2)}
  end

  describe '#max_points' do
    it 'returns sum of max point of all units' do
      expected = course_part_progress.unit_progresses.inject(0) {|sum, u| sum + u.max_points}
      expect(course_part_progress.max_points).to eq(expected)
    end
  end

  describe '#points' do
    subject {course_part_progress.points}
    it {is_expected.to eq( course_part_progress.unit_progresses.inject(0) {|sum, u| sum + u.points})}
  end

  describe '#rebuild!' do
    subject { course_progress.course_part_progresses.first.rebuild! }
    before(:each) { group.course.parts.first.units << build(:empty_unit)}
    it { expect{subject}.to change{course_progress.course_part_progresses.first.unit_progresses.count}.from(2).to(3)}
  end

  describe '#part_beginning' do

  end

  describe '#deadline' do

  end
end
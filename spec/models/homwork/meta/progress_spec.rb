require 'rails_helper'

RSpec.describe Homework::Meta::Progress do
  let(:course) {create :empty_course}
  let(:teacher) {create :user}
  let(:student) {create :user}
  let(:group) {create :group, teacher: teacher, students: [student], course: course}
  let(:course_progress) {group.course_progresses.first}
  let(:course_part_progress) {course_progress.course_part_progresses.first}
  let(:unit_progress) { course_part_progress.unit_progresses.first }

  describe '#build_instance' do
    let(:homework_meta_progress) {build :homework_meta_progress}

    subject{homework_meta_progress.build_homework_prog(unit_progress, student)}

    it {is_expected.to be_a(Homework::Progress)}
  end

  describe '#create_homework_prog' do
    let(:unit){create :unit_without_part, homework_meta: nil}
    let(:homework_meta_progress) {create :homework_meta_progress}
    let(:unit_progress) {create :unit_progress, unit: unit}

    subject{homework_meta_progress.create_homework_prog(unit_progress, student)}
    before(:each) {unit; homework_meta_progress; unit_progress}

    it {expect{subject}.to change{Homework::Progress.count}.by(1)}
  end
end
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
    it 'asd' do
      course_part_progress.count
      expect(course_part_progress.units.count).to eq(2)
      expect(course_part_progress.unit_progresses.count).to eq(2)
    end
  end
end
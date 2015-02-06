require 'rails_helper'

RSpec.describe CoursePartProgress do
  describe 'create new object' do
    before(:each) {subject.save}
    subject{create :course_part_progress}

    it 'creates unit progresses' do
      expect(subject.unit_progresses.count).to eq(2)
    end
  end
end
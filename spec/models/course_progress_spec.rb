require 'rails_helper'

RSpec.describe CourseProgress do
  describe 'create new object' do
    before(:each) {subject.save}
    subject{FactoryGirl.create :course_progress}

    it 'creates parts progresses' do
      expect(subject.course_part_progresses.count).to eq(2)
    end
  end
end
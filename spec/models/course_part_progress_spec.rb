require 'rails_helper'

RSpec.describe CoursePartProgress do
  describe 'create new object' do
    before(:each) {subject.save}
    subject{CoursePartProgress.new}

    it 'creates unit progresses' do
      expect(subject.unit_progresses.count).to eq(1)
    end
  end
end
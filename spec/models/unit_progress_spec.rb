require 'rails_helper'

RSpec.describe UnitProgress do
  describe 'create new object' do
    before(:each) {subject.save}
    subject{UnitProgress.new}

    it 'creates parts progresses' do
      expect(subject.quiz_progress)
      expect(subject.case_progress)
    end
  end
end
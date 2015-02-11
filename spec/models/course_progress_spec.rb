require 'rails_helper'

RSpec.describe CourseProgress do
  describe 'create new object' do
    before(:each) {subject.save}
    subject{create :course_progress}

    it 'creates parts progresses' do
      expect(subject.course_part_progresses.count).to eq(2)
    end
  end

  describe '#max_points' do
    let(:progress) {create :course_progress}
    subject{progress.max_points}

    it {is_expected.to eq(progress.course_part_progresses.inject(0) {|sum, p| sum + p.max_points})}
  end
  describe '#points' do
    let(:progress) {create :course_progress}
    subject{progress.points}

    it {is_expected.to eq(progress.course_part_progresses.inject(0) {|sum, p| sum + p.points})}
  end
end
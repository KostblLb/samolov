require 'rails_helper'

describe CoursePartProgress do
  describe '#max_points' do
    let(:progress) {create :course_part_progress}

    it 'returns sum of max point of all units' do
      expected = progress.unit_progresses.inject(0) {|sum, u| sum + u.max_points}
      expect(progress.max_points).to eq(expected)
    end
  end
  describe '#points' do
    let(:progress) {create :course_part_progress}
    subject {progress.points}
    it {is_expected.to eq( progress.unit_progresses.inject(0) {|sum, u| sum + u.points})}
  end
end
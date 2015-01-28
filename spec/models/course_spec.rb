require 'rails_helper'

RSpec.describe Course, :type => :model do
  describe '#group_for' do
    let(:course) {create :course}
    let(:user) {create :user}
    let(:group) {create :group, course: course, students: [user, create(:user)]}

    it 'returns group for course where user is studying' do
      group
      expect(course.group_for(user)).to eq(group)
    end

  end
end

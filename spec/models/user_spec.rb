require 'rails_helper'

RSpec.describe User, :type => :model do
  describe '#has_course' do
    let(:user) {create :user}
    let(:course) {create :course}

    subject{user.has_course? course}

    context 'user has progress for course' do
      before(:each) {create :course_progress, user: user, course: course}
      it {is_expected.to be_truthy}
    end

    context 'user has not progress for course' do
      it {is_expected.to be_falsey}
    end
  end

  describe '#teacher?' do
    subject{user.teacher?}

    context 'user has not trained groups' do
      let(:user) {create :user}
      it {is_expected.to be_falsey}
    end

    context 'user is teacher in a group' do
      let(:user) {create :user, trained_groups: [(build :group)]}
      it {is_expected.to be_truthy}
    end
  end

  describe '#unreads_messages_count' do
    let(:conversation) {create :conversation}
    subject { conversation.users.last.unreads_messages_count }
    it {is_expected.to eq(2)}
  end

  describe '#friends' do
    let(:left_user) {create :user}
    let(:user) {create :user}
    let(:student1) {create :user}
    let(:group) {create :group, students: [user, student1]}
    subject{user.friends}
    before(:each) {group.save}

    it 'user has teacher in friends' do
      is_expected.to include(group.teacher)
    end

    it 'user has student in friends' do
      is_expected.to include(student1)
    end

    it 'user has not left_user in friends' do
      is_expected.not_to include(left_user)
    end
  end
end

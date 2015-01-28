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
end

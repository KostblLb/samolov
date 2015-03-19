require 'rails_helper'

RSpec.describe Group, :type => :model do

  describe '#cannot_be_a_student?' do

    let(:group) {build :group, teacher: teacher, students: [user]}
    let(:user) {create :user}
    let(:teacher) {create :user}

    context 'teacher is not student' do
      it {expect(group).to be_valid}
    end
    context 'teacher is student' do
      let(:teacher) {user}
      it {expect(group).to be_invalid}
    end
  end

end

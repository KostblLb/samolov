require 'rails_helper'

RSpec.describe Unit, :type => :model do

  describe '#duration' do
    let(:group) {create :group, course: create(:empty_course), education_beginning: Date.new(2015,1,1)}
    it {expect(group.course.duration).to eq(20)}
    it {expect(group.course.parts.first.duration).to eq(10)}
    it {expect(group.course.parts.first.units.first.duration).to eq(5)}
  end

end

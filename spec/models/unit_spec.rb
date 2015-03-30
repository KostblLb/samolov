require 'rails_helper'

RSpec.describe Unit, :type => :model do

  let(:group) {create :group, course: create(:empty_course), education_beginning: Date.new(2015,1,1)}

  describe '#duration' do
    it {expect(group.course.duration).to eq(24)}
    it {expect(group.course.parts.first.duration).to eq(12)}
    it {expect(group.course.parts.first.units.first.duration).to eq(6)}
  end

  describe 'after_create' do
    it {expect(group.course.parts.first.units.first.estimate).to be_persisted}
  end

end

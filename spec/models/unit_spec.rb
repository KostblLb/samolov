require 'rails_helper'

RSpec.describe Unit, :type => :model do

  let(:group) {create :group, course: create(:empty_course), education_beginning: Date.new(2015,1,1)}


  describe '#dup!' do
    subject { group.course.parts.first.units.first.dup! }
    let(:new_unit) { group.course.parts.first.units.first.dup! }
    it 'add new unit' do
      group
      expect{subject}.to change{Unit.count}.by(1)
    end
    it {expect(new_unit.name).to eq('Copy of MyString')}

    it {expect(new_unit.quiz).to be_persisted}
    it {expect(new_unit.case).to be_persisted}
    it {expect(new_unit.quiz.questions.count).to eq(2)}
    it {expect(new_unit.quiz.questions.first.answers.count).to eq(2)}
  end
end

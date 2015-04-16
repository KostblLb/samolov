require 'rails_helper'

RSpec.describe Unit, :type => :model do

  let(:group) {create :group, course: create(:empty_course), education_beginning: Date.new(2015,1,1)}

  describe '#duration' do
    it {expect(group.course.duration).to eq(24)}
    it {expect(group.course.parts.first.duration).to eq(12)}
    it {expect(group.course.parts.first.units.first.duration).to eq(6)}
  end

  describe 'after_create' do
    it {expect(group.course.parts.first.units.first.estimate).not_to be_nil}

    context 'create exam' do
      let(:unit){Unit.create name: 'first123', is_exam: true}
      subject {unit.estimate}
      it{expect(subject.video).to    eq(0)}
      it{expect(subject.test).to     eq(0)}
      it{expect(subject.summary).to  eq(0)}
      it{expect(subject.homework).to eq(0)}
    end
    context 'create not exam' do
      let(:unit){Unit.create name: 'first123', is_exam: false}
      subject {unit.estimate}
      it{expect(subject.video).to    eq(1)}
      it{expect(subject.test).to     eq(1)}
      it{expect(subject.summary).to  eq(1)}
      it{expect(subject.homework).to eq(1)}
    end
  end

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

require 'rails_helper'

describe Quiz do
  let(:group) {create :group, course: create(:empty_course), education_beginning: Date.new(2015,1,1)}

  describe '#unit' do
    let(:unit){create :unit}
    subject{quiz.unit}
    context 'present quiz socket' do
      let(:quiz) {unit.quiz}
      it{is_expected.to eq unit}
    end

    context 'present case socket' do
      let(:quiz) {unit.case}
      it{is_expected.to eq unit}
    end
  end

  describe '#dup!' do
    subject { group.course.parts.first.units.first.quiz.dup! }
    let(:new_quiz) { group.course.parts.first.units.first.quiz.dup! }
    it 'add new quiz' do
      group
      expect{subject}.to change{Quiz.count}.by(1)
    end
    it {expect(new_quiz.name).to eq('Copy of New quiz')}
    it {expect(new_quiz.questions.count).to eq(2)}
    it {expect(new_quiz.questions.first.answers.count).to eq(2)}
  end
end
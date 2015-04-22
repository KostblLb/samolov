require 'rails_helper'

describe Question do
  describe 'validates_uniqueness_of :position' do
    let(:quiz) { create :quiz, questions:[create(:question, position: 1)]}
    let(:other_quiz) { create :quiz, questions:[]}
    it 'in other quiz' do
      question = build(:question, position: 1, quiz: other_quiz)
      expect(question).to be_valid
    end
    it 'with other position' do
      question = build(:question, position: 2, quiz: quiz)
      expect(question).to be_valid
    end
    it 'with duplicate position in one quiz' do
      question = build(:question, position: 1, quiz: quiz)
      expect(question).not_to be_valid
    end
  end

  describe '#set_next_position' do
    let(:quiz) { create :quiz, questions: [create(:question)]}
    it { expect(quiz.questions.first.position).to eq(1) }
    let(:question2) { build :question}
    before(:each) { quiz.questions << question2}
    it { expect(question2.position).to eq(2) }
    let(:question3) { build :question }
    before(:each) do
      quiz.questions << question2
      quiz.questions << question3
    end
    it { expect(question3.position).to eq(3) }
  end

end
require 'rails_helper'

describe QuizProgress do

  describe 'create' do
   let(:quiz) {create :quiz}
   subject {create :quiz_progress, quiz: quiz}

    it 'sets current question as first question in quiz' do
      expect(subject.current_question).to eq(quiz.questions.first)
    end
  end

  describe '#nest_question!' do
    let(:quiz_progress) {create :quiz_progress}
    let(:quiz) {quiz_progress.quiz}

    context 'user has answer on current question' do
      # this case test in user_answer#create spec
    end

    context 'user has not answer on current question' do
      it { expect(quiz_progress.next_question!).to be_falsey }
    end
  end

end
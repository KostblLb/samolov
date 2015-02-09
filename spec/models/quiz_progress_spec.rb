require 'rails_helper'

describe QuizProgress do

  describe 'create' do
   let(:quiz) {create :quiz}
   subject {create :quiz_progress, quiz: quiz}

    it 'sets current question as first question in quiz' do
      expect(subject.current_question).to eq(quiz.questions.first)
    end
  end

  describe '#next_question!' do
    let(:quiz_progress) {create :quiz_progress}
    let(:quiz) {quiz_progress.quiz}

    context 'user has answer on current question' do
      # this case test in user_answer#create spec
    end

    context 'user has not answer on current question' do
      it { expect(quiz_progress.next_question!).to be_falsey }
    end
  end

  describe '#correct_answers_count' do
    subject{quiz_progress.correct_answers_count}
    context 'current-question present' do
      let(:quiz_progress) {create :quiz_progress}
      it{is_expected.to eq(0)}
    end

    context 'current_question is nil' do
      let(:quiz_progress) {create :quiz_progress}
      before :each do
        quiz_progress.quiz.questions.first.answers.first.update! is_correct: true
        quiz_progress.quiz.questions.each do |q|
          create :user_answer, question: q, answer: q.answers.first, quiz_progress: quiz_progress
        end
      end

      it{is_expected.to eq(1)}
    end
  end

  describe '#points' do
    let(:quiz_progress) {create :quiz_progress, quiz_progress_socket: (create :unit_progress)}

    subject{quiz_progress.points}
    it{is_expected.to eq(quiz_progress.scale.points_for quiz_progress.mistakes_count)}
  end

end
require 'rails_helper'

describe QuizProgress do

  describe 'create' do
   let(:quiz) {create :quiz}
   subject {create :quiz_progress, quiz: quiz}

    it 'sets current question as first question in quiz' do
      expect(subject.current_question).to eq(quiz.questions.first)
    end
  end

  describe 'finished?' do
    subject{quiz_progress.finished?}
    let(:quiz_progress) {create :quiz_progress}

    context 'current_question is nil' do
      before(:each) {quiz_progress.current_question = nil}
      it{is_expected.to be_truthy}
    end
    context 'current_question is not nil' do
      it{is_expected.to be_falsey}
    end
  end

  describe '#next_question!' do
    let(:quiz_progress) {create :quiz_progress}
    let(:quiz) {quiz_progress.quiz}

    context 'user has task on current question' do
      # this case test in user_answer#create spec
    end

    context 'user has not task on current question' do
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
        quiz_progress.quiz.questions.first.answers.last.update! is_correct: false
        quiz_progress.quiz.questions.each do |q|
          create :user_answer, question: q, answers: [q.answers.first], quiz_progress: quiz_progress
        end
      end

      it{is_expected.to eq(1)}
    end
  end

  describe '#max_points' do
    let(:unit_progress) {create :unit_progress, unit: unit}
    let(:quiz_progress) {create :quiz_progress, quiz: unit.quiz, quiz_progress_socket: (create :unit_progress)}

    subject{quiz_progress.max_points}

    context 'unit is exam' do
      let(:unit){create :exam}
      it{is_expected.to eq(2 * (quiz_progress.scale.points_for 0))}
    end
    context 'unit is not exam' do
      let(:unit){create :unit}
      it{is_expected.to eq(quiz_progress.scale.points_for 0)}
    end

  end

  describe '#points' do
    let(:unit_progress) {create :unit_progress, unit: unit}
    let(:quiz_progress) {create :quiz_progress, quiz: unit.quiz, quiz_progress_socket: (create :unit_progress)}

    subject{quiz_progress.points}

    context 'quiz is finished' do
      before(:each) {quiz_progress.current_question = nil}

      context 'unit is exam' do
        let(:unit){create :exam}
        it{is_expected.to eq(2 * (quiz_progress.scale.points_for quiz_progress.mistakes_count))}
      end
      context 'unit is not exam' do
        let(:unit){create :unit}
        it{is_expected.to eq(quiz_progress.scale.points_for quiz_progress.mistakes_count)}
      end
    end

    context 'quiz is not finished' do
      let(:unit) {create :unit}
      it{is_expected.to eq(0)}
    end
  end

  describe '#is_quiz' do

    subject{quiz_progress.quiz?}
    context 'quiz progress socket' do
      let(:quiz_progress) {create :quiz_progress, quiz_progress_socket: (create :unit_progress)}
      it { is_expected.to be_truthy }
    end

    context 'case progress socket' do
      let(:quiz_progress) {create :quiz_progress, case_progress_socket: (create :unit_progress)}
      it { is_expected.to be_falsey }
    end
  end

  describe '#is_case' do

    subject{quiz_progress.case?}
    context 'case progress socket' do
      let(:quiz_progress) {create :quiz_progress, case_progress_socket: (create :unit_progress)}
      it { is_expected.to be_truthy }
    end

    context 'quiz progress socket' do
      let(:quiz_progress) {create :quiz_progress, quiz_progress_socket: (create :unit_progress)}
      it { is_expected.to be_falsey }
    end
  end
end
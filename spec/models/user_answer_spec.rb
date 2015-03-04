require 'rails_helper'

RSpec.describe UserAnswer do

  describe 'validations' do
    subject {user_answer.valid?}
    describe 'current question' do
      context 'question is current in progress' do
        let(:user_answer) { build :user_answer }
        it {is_expected.to be_truthy}
      end

      context 'question is not current in progress' do
        let(:user_answer) {build :user_answer, question: (create :question)}
        it {is_expected.to be_falsey}
      end
    end

    describe 'task belongs to question' do
      describe 'task belongs to question' do
        context 'question is current in progress' do
          let(:user_answer) { build :user_answer }
          it {is_expected.to be_truthy}
        end

        context 'task does not belongs to question' do
          let(:user_answer) {build :user_answer, answers: [(create :tasks)]}
          it {is_expected.to be_falsey}
        end
      end
    end
  end

  describe '#correct?' do
    subject{user_answer.correct?}
    let (:quiz_progress) {create :quiz_progress, quiz: question.quiz}
    context 'has only one task' do
      let(:question) {create :question, answers: [create(:tasks, is_correct: true), create(:tasks)]}
      context 'task is correct' do
        let(:user_answer) {create :user_answer, quiz_progress: quiz_progress,
                                  question: question, answers: [question.answers.right.first]}
        it {is_expected.to be_truthy}
      end
      context 'answers is incorrect' do
        let(:user_answer) {create :user_answer, quiz_progress: quiz_progress,
                                  question: question, answers: [question.answers.where(is_correct: false).first]}
        it {is_expected.to be_falsey}
      end
    end

    context 'has many answers' do
      let(:question) {create :question, answers: [create(:tasks, is_correct: true), create(:tasks, is_correct: true), create(:tasks)]}
      context "user's task has all right task" do
        let(:user_answer) {create :user_answer, quiz_progress: quiz_progress,
                                  question: question, answers: question.answers.right}
        it {is_expected.to be_truthy}
      end

      context "user's task has at least one incorrect task" do
        let(:user_answer) {create :user_answer, question: question, quiz_progress: quiz_progress,
                                  answers: [question.answers.where(is_correct: false).first, question.answers.right.first]}
        it {is_expected.to be_falsey}
      end
    end
  end

  describe 'create' do
    let(:quiz_progress) {create :quiz_progress}
    subject {create :user_answer, quiz_progress: quiz_progress}

    it 'sets next question in quiz_progress' do
      expected_next = quiz_progress.quiz.questions.where(:id.gt => quiz_progress.current_question).first
      expect{subject}.to change{quiz_progress.reload.current_question}.to(expected_next)
    end
  end

  describe '#mistakes_count' do
    subject{user_answer.mistakes_count}
    let(:question) {create :question, answers: [create(:tasks, is_correct: true), create(:tasks, is_correct: true), create(:tasks)]}
    let (:quiz_progress) {create :quiz_progress, quiz: question.quiz}
    context "user's task has all right task" do
      let(:user_answer) {create :user_answer, quiz_progress: quiz_progress,
                                question: question, answers: question.answers.right}
      it {is_expected.to eq(0)}
    end

    context  "user's task has a incorrect task" do
      let(:user_answer) {create :user_answer, question: question, quiz_progress: quiz_progress,
                                answers: [question.answers.where(is_correct: false).first, question.answers.right.first]}
      it {is_expected.to eq(1)}
    end
  end

end
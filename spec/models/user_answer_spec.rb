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

    describe 'answer belongs to question' do
      describe 'answer belongs to question' do
        context 'question is current in progress' do
          let(:user_answer) { build :user_answer }
          it {is_expected.to be_truthy}
        end

        context 'answer does not belongs to question' do
          let(:user_answer) {build :user_answer, answers: [(create :answer)]}
          it {is_expected.to be_falsey}
        end
      end
    end
  end

  describe '#correct?' do
    subject{user_answer.correct?}
    let (:quiz_progress) {create :quiz_progress, quiz: question.quiz}
    context 'has only one answer' do
      let(:question) {create :question, answers: [create(:answer, is_correct: true), create(:answer)]}
      context 'answer is correct' do
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
      let(:question) {create :question, answers: [create(:answer, is_correct: true), create(:answer, is_correct: true), create(:answer)]}
      context "user's answer has all right answer" do
        let(:user_answer) {create :user_answer, quiz_progress: quiz_progress,
                                  question: question, answers: question.answers.right}
        it {is_expected.to be_truthy}
      end

      context "user's answer has at least one incorrect answer" do
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

end
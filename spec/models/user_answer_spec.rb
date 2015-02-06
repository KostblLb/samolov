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
          let(:user_answer) {build :user_answer, answer: (create :answer)}
          it {is_expected.to be_falsey}
        end
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
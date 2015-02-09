require 'rails_helper'

describe Api::V1::UserAnswersController, type: :controller do
  describe 'POST create' do
    let(:quiz_progress) {create :quiz_progress}
    let(:answer) {quiz_progress.current_question.answers.first}
    let(:user) {quiz_progress.user}
    let(:attributes) {{question_id: quiz_progress.current_question, answer_ids: [answer.id] }}

    before :each do
      request.accept = 'application/json'
      sign_in user
    end

    subject {post :create, user_answer: attributes}

    it 'creates new user_answer' do
      expect{subject}.to change{UserAnswer.count}.by(1)
    end

    it 'assigns new user answers as @user_answers' do
      subject
      expect(assigns :user_answer).to be_a(UserAnswer)
    end

    it 'assigns with answer' do
      subject
      expect(assigns(:user_answer).answers).to eq([answer])
    end

    it "assigns new answer with user's progress" do
      subject
      expect(assigns(:user_answer).quiz_progress).to eq(QuizProgress.where(user: user, quiz: quiz_progress.quiz).first)
    end
  end
end
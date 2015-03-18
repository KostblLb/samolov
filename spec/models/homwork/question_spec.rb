require 'rails_helper'

describe Question do

  describe '#number' do
    subject{question.number}

    context 'quiz is nil' do
      let(:question) {create :question, quiz: nil}
      it{is_expected.to eq 0}
    end

    context 'question has quiz' do
      let(:quiz){create :quiz}
      let(:question) {quiz.questions.last}

      it{is_expected.to eq(quiz.questions.index(question) + 1)}
    end
  end

end
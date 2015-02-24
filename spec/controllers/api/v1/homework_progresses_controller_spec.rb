require 'rails_helper'

RSpec.describe Api::V1::HomeworkProgressesController, :type => :controller do

  before :each do
    request.accept = 'application/json'
    subject.save
  end
  describe 'POST create answer' do
    let(:student){create :user}
    let(:teacher){create :user}
    subject{create :progress, student: student, teacher: teacher}
    context 'student' do
      before :each do
        sign_in subject.student
        subject.save
      end

      it 'can update answer fields' do
        expect(subject.text_answers.first.update_attributes(answer: 1)).to  be_truthy
      end
      it 'can`t update is_correct field' do
        expect(subject.text_answers.first.update_attributes(is_correct: true)).to be_falsey
      end
    end
  end

end

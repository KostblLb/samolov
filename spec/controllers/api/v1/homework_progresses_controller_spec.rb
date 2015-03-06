require 'rails_helper'

RSpec.describe Api::V1::HomeworkProgressesController, :type => :controller do

  before :each do
    request.accept = 'application/json'
  end
  describe 'PUT update' do
    let(:student){create :user}
    let(:teacher){create :user}



    context 'student' do
      before :each do
        sign_in student
      end

      context 'homework has text task' do
        let(:homework_progress) {create :homework_progress, student: student, teacher: teacher}
        let(:attributes) {{tasks_attributes: [{id:homework_progress.tasks.first.id, _type: 'Homework::Task::Text', answer: "some_answer"}]}}
        subject{put :update, id: homework_progress.id, homework_progress: attributes}
        it 'updates answer fields' do
          expect{subject}.to change{homework_progress.tasks.first.reload.answer}.to("some_answer")
        end
      end

      context 'homework has table task' do
        let(:homework_progress) {create :homework_progress, student: student, teacher: teacher}
        let(:attributes) {{tasks_attributes: [{id:homework_progress.tasks.first.id, _type: 'Homework::Task::Text', answer: "some_answer"},
                                   {id:homework_progress.tasks.second.id, _type: 'Homework::Task::Table', rows:[{id:homework_progress.tasks.second.rows.first.id, cells:['4','5','6']}]}]}}
        subject{put :update, id: homework_progress.id, homework_progress: attributes}
        it 'updates answer fields' do
          expect{subject}.to change{homework_progress.reload.tasks.second.rows.first.cells}.to(['4','5','6'])
        end
        it 'not updates col_names' do
          expect{subject}.not_to change{homework_progress.reload.tasks.second.col_names}
        end
      end

    end
  end

end

require 'rails_helper'

RSpec.describe Api::V1::HomeworkProgressesController, :type => :controller do

  before :each do
    request.accept = 'application/json'
  end
  describe 'PUT update' do
    let(:student){create :user}
    let(:teacher){create :user}
    let(:unit_progress) {create :unit_progress}



    context 'student' do
      before :each do
        sign_in student
      end

      context 'homework has text task' do
        let(:homework_progress) {create :homework_progress, student: student, unit_progress: unit_progress}
        let(:attributes) {{tasks_attributes:
                               [id: homework_progress.tasks.first.id, subtasks_attributes:
                                                                        [{id:homework_progress.tasks.first.subtasks.first.id,
                                                                          _type: 'Homework::Subtask::Text', answer: "some_answer"}]]}}
        subject{put :update, id: homework_progress.id, homework_progress: attributes}
        it 'updates answer fields' do
          expect{subject}.to change{homework_progress.reload.tasks.first.subtasks.first.answer}.to("some_answer")
        end
      end

      context 'homework has table task' do
        let(:homework_progress) {create :homework_progress, student: student, unit_progress: unit_progress}
        let(:attributes) {{tasks_attributes:
                               [{id:homework_progress.tasks.first.id, subtasks_attributes:
                                    [{id:homework_progress.tasks.first.subtasks.first.id, _type: 'Homework::Subtask::Text', answer: "some_answer"},
                                   {id:homework_progress.tasks.first.subtasks.second.id, _type: 'Homework::Subtask::Table', rows:
                                       [{id:homework_progress.tasks.second.rows.first.id, cells:['4','5','6']}]}]}]}}
        subject{put :update, id: homework_progress.id, homework_progress: attributes}
        it 'updates answer fields' do
          expect{subject}.to change{homework_progress.reload.tasks.first.subtasks.second.rows.first.cells}.to(['4','5','6'])
        end
        it 'not updates col_names' do
          expect{subject}.not_to change{homework_progress.reload.tasks.first.sutasks.second.col_names}
        end
      end
    end
    context 'teacher' do
      before :each do
        sign_in teacher
      end

      context 'homework has text task' do
        let(:homework_progress) {create :homework_progress, student: student, state: 'review', unit_progress: unit_progress}
        let(:attributes) {{tasks_attributes: [{id:homework_progress.tasks.first.id, _type: 'Homework::Task::Text', is_correct: true}]}}
        subject{put :update, id: homework_progress.id, homework_progress: attributes}
        it 'updates answer fields' do
          expect{subject}.to change{homework_progress.tasks.first.reload.is_correct}.to be_truthy
        end
      end
    end
  end
end



require 'rails_helper'

RSpec.describe Api::V1::HomeworkProgressesController, :type => :controller do

  before :each do
    request.accept = 'application/json'
  end
  describe 'PUT update' do
    let(:unit_progress) {create :unit_progress}



    context 'student' do
      before :each do
        sign_in unit_progress.user
      end
      context 'has text task' do
        let(:homework_progress) {create :homework_progress, unit_progress: unit_progress}
        let(:attributes) {{tasks:[id: homework_progress.tasks.first.id, subtasks:
                          [id:homework_progress.tasks.first.subtasks.first.id, _type: 'Homework::Subtask::Text', answer: "some_answer"]]}}
        subject{put :update, id: homework_progress.id, homework_progress: attributes}
        it 'updates answer fields' do
          expect{subject}.to change{homework_progress.reload.tasks.first.subtasks.first.answer}.to("some_answer")
          expect{subject}.to_not change{homework_progress.reload.tasks.first.subtasks.first.meta}
        end
      end
      context 'has table task' do
        let(:homework_progress) {create :homework_progress_with_table, unit_progress: unit_progress}
        let(:attributes) {{tasks:[id: homework_progress.tasks.first.id, subtasks:
                         [id:homework_progress.tasks.first.subtasks.first.id, _type: 'Homework::Subtask::Table', rows: [id:homework_progress.tasks.first.subtasks.first.rows.first.id, cells:['1','2']]]]}}
        subject{put :update, id: homework_progress.id, homework_progress: attributes}
        it 'updates table' do
          expect{subject}.to change{homework_progress.reload.tasks.first.subtasks.first.rows.first.cells}.to(["1","2"])
        end
        it 'doesnt touch meta' do
          expect{subject}.to_not change{homework_progress.reload.tasks.first.subtasks.first.meta}
          expect{subject}.to_not change{homework_progress.reload.tasks.first.subtasks.first.rows.first.meta}

        end
      end


    end
    context 'teacher' do
      before :each do
        sign_in unit_progress.teacher
      end

      context 'homework has text task' do
        let(:homework_progress) {create :homework_progress, student: student, state: 'review', unit_progress: unit_progress}
        let(:attributes) {{tasks: [{id:homework_progress.tasks.first.id, _type: 'Homework::Task::Text', is_correct: true}]}}
        subject{put :update, id: homework_progress.id, homework_progress: attributes}
        it 'updates answer fields' do
          expect{subject}.to change{homework_progress.tasks.first.reload.is_correct}.to be_truthy
        end
      end
    end
  end
end



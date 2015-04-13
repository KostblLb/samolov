require 'rails_helper'

RSpec.describe Api::V1::HomeworkProgressesController, :type => :controller do

  before :each do
    request.accept = 'application/json'
  end
  describe 'PUT update' do
    let(:course) {create :empty_course}
    let(:teacher) {create :user}
    let(:student) {create :user}
    let(:group) {create :group, teacher: teacher, students: [student], course: course, education_beginning: Date.new(2015,1,1)}
    let(:course_progress) { group.course.course_progresses.first }
    let(:course_part_progress) { course_progress.course_part_progresses.first }
    let(:unit_progress) { course_part_progress.unit_progresses.first }

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
                                                                          [id:homework_progress.tasks.first.subtasks.first.id, _type: 'Homework::Subtask::Table',
                                                                           rows: [id:homework_progress.tasks.first.subtasks.first.rows.first.id, cells: cells]]]}}
        subject{put :update, id: homework_progress.id, homework_progress: attributes}

        RSpec.shared_examples 'update data' do
          it 'updates table' do
            expect{subject}.to change{homework_progress.reload.tasks.first.subtasks.first.rows.first.cells}.to(cells)
          end
          it 'doesnt touch meta' do
            expect{subject}.to_not change{homework_progress.reload.tasks.first.subtasks.first.meta}
            expect{subject}.to_not change{homework_progress.reload.tasks.first.subtasks.first.rows.first.meta}
          end
        end

        context 'cells have not null elements' do
          let(:cells) {['1', '2']}
          include_examples 'update data'
        end
        context 'cells have  null elements' do
          let(:cells) {['1', nil]}
          include_examples 'update data'
          it {expect{subject}.not_to change{homework_progress.tasks.first.subtasks.first.rows.first.cells.count}}
        end
      end

      context 'has profile task' do
        let(:homework_progress) {create :homework_progress_with_profile, unit_progress: unit_progress}
        let(:attributes) {{tasks:[id: homework_progress.tasks.first.id, subtasks:
                                                                          [id:homework_progress.tasks.first.subtasks.first.id, _type: 'Homework::Subtask::PositionProfile',
                                                                           profile_compulsory: { id: homework_progress.tasks.first.subtasks.first.profile_compulsory.id, sex: 'male', age: '20'} ]]}}
        subject{put :update, id: homework_progress.id, homework_progress: attributes}
        it 'updates profile_compulsory' do
          expect{subject}.to change{homework_progress.reload.tasks.first.subtasks.first.profile_compulsory.sex}.to('male')
        end
      end

      context 'has select task' do
        let(:homework_progress) {create :homework_progress_with_select, unit_progress: unit_progress}
        let(:homework_meta_option) {create :homework_meta_option }
        let(:attributes) {{tasks:[id: homework_progress.tasks.first.id, subtasks:
                                                                          [id:homework_progress.tasks.first.subtasks.first.id, _type: 'Homework::Subtask::Select',
                                                                           answers: [homework_meta_option.id] ]]}}
        subject{put :update, id: homework_progress.id, homework_progress: attributes}
        it 'updates select answers' do
          expect{subject}.to change{homework_progress.reload.tasks.first.subtasks.first.answers}.to([homework_meta_option])
        end
      end

      context 'has fish task' do
        let(:homework_progress) {create :homework_progress_with_fish, unit_progress: unit_progress}
        let(:homework_meta_option) {create :homework_meta_option}
        let(:attributes) {{tasks:[id: homework_progress.tasks.first.id, subtasks:
                                                                          [id:homework_progress.tasks.first.subtasks.first.id, _type: 'Homework::Subtask::Fish',
                                                                           fish_body: 'q', fish_head: 'qq']]}}
        subject{put :update, id: homework_progress.id, homework_progress: attributes}
        it 'updates fish body' do
          expect{subject}.to change{homework_progress.reload.tasks.first.subtasks.first.fish_body}.to('q')
        end
        it 'updates fish head' do
          expect{subject}.to change{homework_progress.reload.tasks.first.subtasks.first.fish_head}.to('qq')
        end
      end

      context 'save homework' do
        let(:group) {create :group, teacher: create(:user), students: [create(:user)], course: create(:empty_course), education_beginning: Date.new(2015,1,1)}
        let(:unit_progress_first) {group.course_progresses.first.course_part_progresses.first.unit_progresses.first}
        let(:unit_progress_last) {group.course_progresses.first.course_part_progresses.first.unit_progresses.last}
        let(:homework_progress) {unit_progress_first.homework_progress}
        before(:each) do
          5.times { unit_progress_first.next_step }
          sign_in unit_progress_first.user
        end
        let(:attributes) {{state_event: 'complete', tasks: [{id:homework_progress.tasks.first.id}]}}
        subject{put :update, id: homework_progress.id, homework_progress: attributes}

        context 'next unit not disabled' do
          before(:each) {unit_progress_last.next_step}
          it 'updates homework progress state' do
            expect{subject}.to change{homework_progress.reload.state}.from('in_progress').to('review')
          end
          it 'updates unit progress state' do
            expect{subject}.to change{unit_progress_first.reload.state}.from('homework').to('done')
          end
          it 'updates unit progress state' do
            expect{subject}.not_to change{unit_progress_last.reload.state}
          end
        end
      end

    end
    context 'teacher' do
      before :each do
        sign_in unit_progress.teacher
      end

      context 'homework has text task' do
        let(:homework_progress) {create :homework_progress, state: 'review', unit_progress: unit_progress}
        let(:attributes) {{tasks: [{id:homework_progress.tasks.first.id, _type: 'Homework::Task::Text', is_correct: false}]}}
        subject{put :update, id: homework_progress.id, homework_progress: attributes}
        it 'updates answer fields' do
          expect{subject}.to change{homework_progress.tasks.first.reload.is_correct}.to be_falsey
        end
      end

      context 'finish checking homework' do
        let(:homework_progress) {create :homework_progress, state: 'review', unit_progress: unit_progress}
        let(:attributes) {{state_event: 'verify', tasks: [{id:homework_progress.tasks.first.id, is_correct: false, comment: '123123'}]}}
        subject{put :update, id: homework_progress.id, homework_progress: attributes}
        it 'updates homework progress state' do
          expect{subject}.to change{homework_progress.reload.state}.from('review').to('verified')
        end

        it 'updates comment to first task' do
          expect{subject}.to change{homework_progress.tasks.first.reload.comment}.from(nil).to('123123')
        end
      end
    end
  end
end



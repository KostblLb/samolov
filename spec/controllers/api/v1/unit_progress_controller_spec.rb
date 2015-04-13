require 'rails_helper'

RSpec.describe Api::V1::UnitProgressesController, :type => :controller do
  let(:course) {create :empty_course}
  let(:teacher) {create :user}
  let(:student) {create :user}
  let(:group) {create :group, teacher: teacher, students: [student], course: course, education_beginning: Date.new(2015,1,1) }
  let(:unit_progress){ group.course_progresses.first.course_part_progresses.first.unit_progresses.last }
  before :each do
    request.accept = 'application/json'
  end

  describe 'PUT update' do
    subject{put :update, id: unit_progress.id, unit_progress: {state_event: 'next_step', webinar_score: 2}}

    it 'updates state' do
      expect{subject}.to change{unit_progress.reload.state}
    end

    it 'assigns unit_progress has a new state' do
      subject
      expect((assigns :unit_progress).state).to eq('quiz')
    end

    it 'returns updated unit_progress as JSON' do
      subject
      expect(response.body).to eq(UnitProgressSerializer.new(assigns :unit_progress).to_json)
    end

    context 'user authorize' do
      before :each do
        sign_in unit_progress.user
      end
      it 'updates webinar_score' do
        expect{subject}.not_to change{unit_progress.reload.webinar_score}
      end
    end

    context 'teacher authorize' do
      before :each do
        sign_in unit_progress.teacher
      end
      it 'updates webinar_score' do
        expect{subject}.to change{unit_progress.reload.webinar_score}.to(2)
      end
    end

  end
end
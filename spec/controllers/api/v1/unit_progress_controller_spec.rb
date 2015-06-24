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
    subject{put :update, id: unit_progress.id, unit_progress: {webinar_score: 2}}


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

  describe 'GET index' do
      let(:group){ create :group }
      let(:unit_progress){ group.unit_progresses[0]}
      let(:other_unit_progress)  { group.unit_progresses[1]}

      before(:each) do
        unit_progress; other_unit_progress
        get :index, ids: ids
      end

      subject{assigns :unit_progresses}

      context 'pass ids' do
        let(:ids) {[unit_progress.id]}

        it{is_expected.to include unit_progress}
        it{is_expected.not_to include other_unit_progress}
      end

      context 'not pass ids' do
        let(:ids) {nil}

        it{is_expected.to include unit_progress}
        it{is_expected.to include other_unit_progress}
      end

      context 'should return json' do
        let(:ids) {nil}
        it 'responds with JSON' do
          expect { JSON.parse(response.body) }.to_not raise_error
        end
      end
  end


    #   let(:unit_progress_first) {group.course_progresses.first.course_part_progresses.first.unit_progresses.first}
    #   let(:unit_progress_last) {group.course_progresses.first.course_part_progresses.first.unit_progresses.last}
    #
    #   let(:unit_progress_first){ UnitProgress.find resource.Unitprogress_id }
    #
    #   get :index, {unit_progress_firs:id => @unit_progress_first}
    #
    #   expect(assigns(:unit_progresses_first)).to eq(unit.progresses.id)
    #
    #   get :index, {:id => @unit_progress_first.to_param}
    #   expect(assigns(:course)).to eq(course)
    #
    #   #expect(json["id"]).to eq(@unit_progress_first.id)
    #   #expect(group).to match_array
    # end
end
    # it{is_expected.to include group}
    # it{is_expected.not_to include group}
    #
    # let(:attributes) {{unit_progress:[id
    #
    # before do
    # get :index, format: :json
    # end
    #
    # get :index, {:id => @unit_progress.to_param}
    # expect(json.collect{|id| l[" "]}).to include(@unit_progress)
    #
    # it 'sets the unit_progress_id field' do
    # resource.Unitprogress_id.should equal(unitprogress.id)
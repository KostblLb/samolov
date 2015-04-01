require 'rails_helper'

RSpec.describe UnitProgress do
  describe 'create new object' do
    subject{FactoryGirl.create :unit_progress}

    before(:each) {subject.save}
    it 'creates parts progresses' do
      expect(subject.quiz_progress)
      expect(subject.case_progress)
    end

    context 'create exam' do
      subject{create :unit_progress, unit: create(:exam)}
      it 'has state equals case' do
        expect(subject.disabled?).to be_truthy
      end
    end
  end

  describe 'next step' do
    subject{unit_progress.next_step}

    context 'unit is not exam' do
      let(:unit_progress) {create :unit_progress, state: :disabled}
      it {expect{subject}.to change{unit_progress.reload.state}.from('disabled').to('video')}
    end

    context 'unit is exam' do
      context 'unit progress state disabled' do
        let(:unit_progress) {create :unit_progress, unit: create(:exam), state: :disabled}
        it {expect{subject}.to change{unit_progress.reload.state}.from('disabled').to('case')}
      end
      context 'unit progress state webinar' do
        let(:unit_progress) {create :unit_progress, unit: create(:exam), state: :webinar}
        it {expect{subject}.to change{unit_progress.reload.state}.from('webinar').to('done')}
      end
    end
  end

  describe '#max_points' do
    subject {progress.max_points}
    context 'unit is not exam' do
      let(:progress) {create :unit_progress}
      it {is_expected.to eq(progress.quiz_progress.max_points + progress.case_progress.max_points + progress.homework_progress.max_points + 5)}
    end

    context 'unit is exam' do
      let(:unit){create(:exam)}
      let(:progress) {
        create :unit_progress,
               quiz_progress: create(:quiz_progress, quiz: unit.quiz),
               case_progress: create(:quiz_progress, quiz: unit.case),
               unit: unit
      }
      it {is_expected.to eq(progress.quiz_progress.max_points + progress.case_progress.max_points + progress.homework_progress.max_points + 15)}
    end
  end

  describe '#max_webinar_points' do
    subject{progress.max_webinar_points}

    context 'unit is exam' do
      let(:progress) {create :unit_progress, unit: (create :exam)}
      it{is_expected.to eq 15}
    end

    context 'unit is not exam' do
      let(:progress) {create :unit_progress, unit: (create :unit)}
      it{is_expected.to eq 5}
    end
  end

  describe '#points' do
    subject {progress.points}
    context 'unit is not exam' do
      let(:progress) {create :unit_progress}
      it {is_expected.to eq(progress.quiz_progress.points + progress.case_progress.points + progress.webinar_score)}
    end
    context 'unit is exam' do
      let(:progress) {create :unit_progress, unit: create(:exam)}
      it {is_expected.to eq(progress.quiz_progress.points + progress.case_progress.points + progress.webinar_score)}
    end
  end

  let(:course) {create :empty_course}
  let(:teacher) {create :user}
  let(:student) {create :user}
  let(:group) {create :group, teacher: teacher, students: [student], course: course, education_beginning: Date.new(2015,1,1)}

  describe '#rebuild!' do

    subject {student.unit_progresses.first.rebuild!}

    context 'add quiz'do
      before(:each) {group.course.parts.first.units.first.quiz = create(:quiz)}
      it {expect{subject}.to change{student.quiz_progresses.count}.from(8).to(9)}
      it {expect{subject}.not_to change{student.my_homeworks.count}}
      it {expect{subject}.to change{student.my_homeworks.last}}
      it {expect{subject}.not_to change{student.unit_progresses}}
    end

    context 'add case'do
      before(:each) {group.course.parts.first.units.first.case = create(:quiz)}
      it {expect{subject}.to change{student.quiz_progresses.count}.from(8).to(9)}
      it {expect{subject}.not_to change{student.my_homeworks.count}}
      it {expect{subject}.to change{student.my_homeworks.last}}
      it {expect{subject}.not_to change{student.unit_progresses}}
    end

    context 'homework state review'do
      before(:each) do
        group.save
        student.unit_progresses.first.homework_progress.complete
      end
      it {expect{subject}.not_to change{student.my_homeworks.count}}
      it {expect{subject}.not_to change{student.quiz_progresses.count}}
      it {expect{subject}.not_to change{student.unit_progresses}}
    end
  end

  describe 'unit_beginning' do

    context 'all unit_progresses&course_part_progresses are exist' do
      it {expect(group.course_progresses.first.course_part_progresses.first.unit_progresses.first.unit_beginning).to eq(Date.new(2015,1,1))}
      it {expect(group.course_progresses.first.course_part_progresses.last.unit_progresses.first.unit_beginning).to eq(Date.new(2015,1,13))}
    end

    context 'previous unit_progress is not exist' do
      before(:each) do
        group.course_progresses.first.course_part_progresses.first.unit_progresses = nil
      end
      it {expect(group.course_progresses.first.course_part_progresses.last.unit_progresses.first.unit_beginning).to eq(Date.new(2015,1,13))}
      it {expect(group.course_progresses.first.course_part_progresses.last.unit_progresses.first.video_deadline).to eq(Date.new(2015,1,14))}
    end

    context 'previous course_part_progress is not exist' do
      before(:each) do
        group.course_progresses.first.course_part_progresses.first.delete
      end
      it {expect(group.course_progresses.first.course_part_progresses.last.unit_progresses.first.unit_beginning).to eq(Date.new(2015,1,13))}
      it {expect(group.course_progresses.first.course_part_progresses.last.unit_progresses.first.video_deadline).to eq(Date.new(2015,1,14))}
    end
  end
end
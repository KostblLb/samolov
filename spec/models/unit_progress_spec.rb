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
        expect(subject.case?).to be_truthy
      end
    end
  end

  describe 'next step' do
    let(:unit_progress) {create :unit_progress, state: :disabled}
    subject{unit_progress.next_step}

    it {expect{subject}.to change{unit_progress.reload.state}.from('disabled').to('video')}
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

  describe '#rebuild!' do
    let(:course) {create :empty_course}
    let(:teacher) {create :user}
    let(:student) {create :user}
    let(:group) {create :group, teacher: teacher, students: [student], course: course}

    subject {student.unit_progresses.first.rebuild!}

    context 'add quiz'do
      before(:each) {group.course.parts.first.units.first.quiz = create(:quiz)}
      it {expect{subject}.to change{student.quiz_progresses.count}.from(8).to(9)}
      it {expect{subject}.to change{student.my_homeworks.count}.from(4).to(5)}
      it {expect{subject}.not_to change{student.unit_progresses}}
    end

    context 'add case'do
      before(:each) {group.course.parts.first.units.first.case = create(:quiz)}
      it {expect{subject}.to change{student.quiz_progresses.count}.from(8).to(9)}
      it {expect{subject}.to change{student.my_homeworks.count}.from(4).to(5)}
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
end
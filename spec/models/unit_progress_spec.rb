require 'rails_helper'

RSpec.describe UnitProgress do
  let(:group) {create :group, teacher: (create :user), students: [(create :user)], course: (create :empty_course)}
  let(:course_progress) { group.course_progresses.first }
  let(:course_part_progress) { course_progress.course_part_progresses.first }
  let(:unit_progress) { course_part_progress.unit_progresses.first }

  describe 'create new object' do
    context 'unit is not exam' do
      it {expect(unit_progress.state).to eq('video')}
      it {expect(unit_progress.quiz_progress).to be_persisted}
      it {expect(unit_progress.case_progress).to be_persisted}
      it {expect(unit_progress.homework_progress).to be_persisted}
    end
    context 'unit is exam' do
      let(:exam_progress) {create :unit_progress, unit: (create :exam)}
      it {expect(exam_progress.state).to eq('case')}
      it {expect(unit_progress.case_progress).to be_persisted}
    end
  end

  describe '#max_points' do
    subject {unit_progress.max_points}
    context 'unit is not exam' do
      it {is_expected.to eq(unit_progress.quiz_progress.max_points + unit_progress.case_progress.max_points + unit_progress.homework_progress.max_points + 5)}
    end
    context 'unit is exam' do
      let(:group) {create :group, teacher: (create :user), students: [(create :user)], course: (create :course_with_exam)}
      let(:unit_progress) { group.course_progresses.first.course_part_progresses.first.unit_progresses.first }
      it {is_expected.to eq(unit_progress.quiz_progress.max_points + unit_progress.case_progress.max_points + unit_progress.homework_progress.max_points + 15)}
    end
  end

  describe '#points' do
    subject {progress.points}
    context 'unit is not exam' do
      let(:progress) {create :unit_progress, unit: create(:unit)}
      it {is_expected.to eq(progress.quiz_progress.points + progress.case_progress.points + progress.webinar_score)}
    end
    context 'unit is exam' do
      let(:progress) {create :unit_progress, unit: create(:exam)}
      it {is_expected.to eq(progress.quiz_progress.points + progress.case_progress.points + progress.webinar_score)}
    end
  end

  describe '#max_webinar_points' do
    subject {unit_progress.max_webinar_points}
    context 'unit is not exam' do
      it {is_expected.to eq 5}
    end
    context 'unit is exam' do
      let(:unit_progress) {create :unit_progress, unit: (create :exam)}
      it {is_expected.to eq 15}
    end
  end

  describe '#next_step' do
    subject {unit_progress.next_step}
    context 'unit is not exam' do
      it {expect{subject}.to change{unit_progress.state}.from('video').to('quiz')}
    end
    context 'unit is exam' do
      let(:unit_progress) {create :unit_progress, unit: (create :exam)}
      it {expect{subject}.to change{unit_progress.state}.from('case').to('webinar')}
    end
  end

  describe '#rebuild!' do
    let(:student) { group.students.first }
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

  describe '#unit_beginning' do

  end
end
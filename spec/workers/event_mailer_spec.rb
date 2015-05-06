require 'rails_helper'

RSpec.describe EventMailerWorker, :type => :worker do
  include EmailSpec::Helpers
  include EmailSpec::Matchers

  let(:course_progress) { group.course_progresses.first }
  let(:course_part_progress) { course_progress.course_part_progresses.first }
  let(:unit_progress) { course_part_progress.unit_progresses.first }

  describe '#tommorow_event' do
    subject { EventMailerWorker.new.tommorow_event(unit_progress) }
    context 'tomorrow video' do
      let(:group) {create :group, teacher: (create :user), students: [(create :user)],
                          course: (create :empty_course), education_beginning: Date.today + 1}
      it {is_expected.to eq('видео')}
    end
    context 'tomorrow quiz' do
      let(:group) {create :group, teacher: (create :user), students: [(create :user)],
                          course: (create :empty_course), education_beginning: Date.today}
      it {is_expected.to eq('тест')}
    end
    context 'tomorrow summary' do
      let(:group) {create :group, teacher: (create :user), students: [(create :user)],
                          course: (create :empty_course), education_beginning: Date.today - 1}
      it {is_expected.to eq('конспект')}
    end
    context 'tomorrow case' do
      let(:group) {create :group, teacher: (create :user), students: [(create :user)],
                          course: (create :empty_course), education_beginning: Date.today - 2}
      it {is_expected.to eq('кейс')}
    end
    context 'tomorrow webinar' do
      let(:group) {create :group, teacher: (create :user), students: [(create :user)],
                          course: (create :empty_course), education_beginning: Date.today - 3}
      it {is_expected.to eq('вебинар')}
    end
    context 'tomorrow homework' do
      let(:group) {create :group, teacher: (create :user), students: [(create :user)],
                          course: (create :empty_course), education_beginning: Date.today - 4}
      it {is_expected.to eq('домашнее задание')}
    end
    context 'event nil' do
      let(:group) {create :group, teacher: (create :user), students: [(create :user)],
                          course: (create :empty_course), education_beginning: Date.today + 100}
      it {is_expected.to be_nil}
    end
  end

  describe '#tommorow_event_exam' do
    subject { EventMailerWorker.new.tommorow_event_exam(unit_progress) }
    before(:each) {group.save}
    context 'tomorrow case' do
      let(:group) {create :group, teacher: (create :user), students: [(create :user)],
                          course: (create :course_with_exam), education_beginning: Date.today + 1}
      it {is_expected.to eq('Экзаминационный тест')}
    end
    context 'tomorrow skype-game' do
      let(:group) {create :group, teacher: (create :user), students: [(create :user)],
                          course: (create :course_with_exam), education_beginning: Date.today-3}
      it {is_expected.to eq('Экзаменационная Скайп-игра')}
    end
  end

  describe '#perform' do
    let(:group) {create :group, teacher: (create :user), students: [(create :user)],
                       course: (create :course_with_exam), education_beginning: Date.today + 1}
    subject { EventMailerWorker.new.tommorow_event_exam(unit_progress) }
    before(:each) {group.save}
  end

  describe 'upcoming_event' do
    let(:student) {create :user}
    let(:group) {create :group, teacher: (create :user), students: [student],
                        course: (create :course_with_exam), education_beginning: Date.today + 1}
    let(:email) { EventMailer.send_mail('Не пропустите', student, 'tommorow event') }

    it {expect(email).to deliver_to(student.email)}
    it {expect(email).to deliver_from('Samolov <samolov.dev@yandex.ru>')}
    it {expect(email).to have_body_text('tommorow event')}
    it {expect(email).to have_subject('Не пропустите')}
  end
end

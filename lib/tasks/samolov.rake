namespace :samolov do
  desc "Re save user's answers"
  task resave_users_answers: :environment do
    UserAnswer.each &:save
  end

  desc "Resolve position for parts and units"
  task resolve_position: :environment do
    Part.where(position: nil).update_all(position: 1)
    Unit.where(position: nil).update_all(position: 1)
  end

  desc "Resolve state for units which homework_progress.state = verified"
  task resolve_state: :environment do
    progresses = Homework::Progress.where(state: 'verified').map &:unit_progress_id
    UnitProgress.where(:id.in => progresses).update_all(state: 'done')
  end

  desc 'Change estimate for homework and case&webinar for exam'
  task change_estimate: :environment do
    Unit.where(is_exam: false).update_all('estimate.homework' => 2)
    Unit.where(is_exam: true).update_all('estimate.video' => 0, 'estimate.test' => 0, 'estimate.summary' => 0,
                                         'estimate.case' => 4, 'estimate.webinar' => 3, 'estimate.homework' => 0)
  end
end
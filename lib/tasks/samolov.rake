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

  desc "Resolve position for questions and answers"
  task resolve_position_questions: :environment do
    Question.where(position: nil).update_all(position: 1)
    Answer.where(position: nil).update_all(position: 1)
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

  desc 'Set orders for tasks'
  task set_orders: :environment do
    Homework::Progress.each do |progress|
      progress.tasks.each do |task|
        unless task.meta.nil?
          task.update(order: task.meta.order)
        else
          task.remove
        end
      end
    end
  end

  desc 'Create profile compulsory and desirable for tasks'
  task create_profile_compulsory: :environment do
    Homework::Progress.each do |pr|
      pr.tasks.each do |t|
        t.subtasks.where(_type: 'Homework::Subtask::PositionProfile').each do |position_profile|
          position_profile.create_profile_compulsory if position_profile.profile_compulsory.nil?
          position_profile.create_profile_desirable  if position_profile.profile_desirable.nil?
        end
      end
    end
  end
end


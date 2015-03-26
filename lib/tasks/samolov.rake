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
end
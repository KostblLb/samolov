namespace :samolov do
  desc "Re save user's answers"
  task resave_users_answers: :environment do
    UserAnswer.each &:save
  end
end
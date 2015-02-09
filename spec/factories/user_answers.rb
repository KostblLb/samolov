FactoryGirl.define do
  factory :user_answer do
    association :quiz_progress

    after(:build) do |user_answer|
      user_answer.question ||= user_answer.quiz_progress.current_question
      user_answer.answers ||= [user_answer.question.answers.first]
    end

  end
end

FactoryGirl.define do
  factory :quiz_progress do
    association :quiz
    association :user
  end
end

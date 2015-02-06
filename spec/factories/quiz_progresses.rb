FactoryGirl.define do
  factory :quiz_progress do
    association :quiz
    association :student, factory: :user
  end
end

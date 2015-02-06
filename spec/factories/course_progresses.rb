FactoryGirl.define do
  factory :course_progress do
    association :student, factory: :user
    association :course
  end
end

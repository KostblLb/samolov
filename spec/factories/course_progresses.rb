FactoryGirl.define do
  factory :course_progress do
    association :user
    association :course
  end
end

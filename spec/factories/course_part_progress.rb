FactoryGirl.define do
  factory :course_part_progress do
    association :course_progress
    association :part
    association :student, factory: :user
  end
end

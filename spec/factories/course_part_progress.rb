FactoryGirl.define do
  factory :course_part_progress do
    association :course_progress
    association :part
    association :user
  end
end

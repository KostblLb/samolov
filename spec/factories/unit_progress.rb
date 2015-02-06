FactoryGirl.define do
  factory :unit_progress do
    association :course_part_progress
    association :unit
    association :student, factory: :user
  end
end

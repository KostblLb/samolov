FactoryGirl.define do
  factory :unit_progress do
    association :course_part_progress
    association :unit
    association :user
    association :quiz_progress
    association :case_progress, factory: :quiz_progress
    association :homework_progress, factory: :progress
  end
end

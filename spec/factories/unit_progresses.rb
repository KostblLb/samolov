FactoryGirl.define do
  factory :unit_progress do
    association :course_part_progress
  end
end

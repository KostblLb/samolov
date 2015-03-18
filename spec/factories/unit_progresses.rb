FactoryGirl.define do
  factory :unit_progress do
    webinar_score 4
    association :course_part_progress
    association :unit
    association :user
    association :quiz_progress
    association :case_progress, factory: :quiz_progress
  end
end

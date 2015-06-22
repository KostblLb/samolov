FactoryGirl.define do
  factory :full_unit_progress, class: UnitProgress do
    webinar_score 4
    association :course_part_progress
    association :unit
    association :user
    association :quiz_progress
    association :case_progress, factory: :quiz_progress
    association :homework_progress
  end

  factory :unit_progress do
    association :user
    association :quiz_progress
    association :case_progress, factory: :quiz_progress
    association :homework_progress
    webinar_score 4
  end
end

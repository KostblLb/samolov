FactoryGirl.define do
  factory :course_part_progress do
    association :course_progress
    association :part
    association :user
    unit_progresses {[build(:unit_progress, course_part_progress: nil), build(:unit_progress, course_part_progress: nil)]}
  end
end

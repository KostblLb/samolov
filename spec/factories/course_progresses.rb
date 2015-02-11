FactoryGirl.define do
  factory :course_progress do
    association :user
    association :course
    association :group
    course_part_progresses {[build(:course_part_progress, course_progress: nil), build(:course_part_progress, course_progress: nil)]}
  end
end

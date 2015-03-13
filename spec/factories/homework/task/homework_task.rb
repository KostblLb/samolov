FactoryGirl.define do
  factory :homework_task, class: Homework::Task do
    subtasks {[build(:homework_subtask_text), build(:homework_subtask_position_profile)]}
  end
end
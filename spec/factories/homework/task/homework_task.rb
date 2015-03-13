FactoryGirl.define do
  factory :homework_task, class: Homework::Task do
    subtasks {[build(:homework_subtask_text), build(:homework_subtask_position_profile)]}
  end

  factory :homework_task_with_table, class: Homework::Task do
    subtasks {[build(:homework_subtask_table)]}
  end
end
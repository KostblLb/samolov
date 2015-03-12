FactoryGirl.define do
  factory :homework_task, class: Homework::Task do
    subtasks {[build(:homework_subtask_text)]}
  end
end
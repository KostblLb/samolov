FactoryGirl.define do
  factory :homework_progress, class: Homework::Progress do
     tasks{[build(:homework_task_text), build(:homework_task_table)]}
    end
end
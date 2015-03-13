FactoryGirl.define do
  factory :homework_progress, class: Homework::Progress do
     tasks {[build(:homework_task)]}
  end

  factory :homework_progress_with_table, class: Homework::Progress do
    tasks {[build(:homework_task_with_table)]}
  end
end
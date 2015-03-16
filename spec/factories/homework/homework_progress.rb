FactoryGirl.define do
  factory :homework_progress, class: Homework::Progress do
     tasks {[build(:homework_task)]}
  end

  factory :homework_progress_with_table, class: Homework::Progress do
    tasks {[build(:homework_task_with_table)]}
  end

  factory :homework_progress_with_profile, class: Homework::Progress do
    tasks {[build(:homework_task_with_profile)]}
  end

  factory :homework_progress_with_select, class: Homework::Progress do
    tasks {[build(:homework_task_with_select)]}
  end

  factory :homework_progress_with_fish, class: Homework::Progress do
    tasks {[build(:homework_task_with_fish)]}
  end
end
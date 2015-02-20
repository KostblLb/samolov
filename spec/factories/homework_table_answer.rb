FactoryGirl.define do
  factory :table_answer, :class => Homework::Task::Table do
    association :homework_progress
  end
end
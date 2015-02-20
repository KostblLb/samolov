FactoryGirl.define do
  factory :text_answer, :class => Homework::Task::Text do
    association :homework_progress
  end
end
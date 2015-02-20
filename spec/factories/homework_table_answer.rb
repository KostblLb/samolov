FactoryGirl.define do
  factory :table_answer, :class => Homework::TableAnswer do
    association :homework_progress
  end
end
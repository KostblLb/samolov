FactoryGirl.define do
  factory :homework_progress, class: Homework::Progress do
     tasks {[build(:homework_task)]}
    end
end
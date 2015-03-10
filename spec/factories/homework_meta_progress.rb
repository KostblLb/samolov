FactoryGirl.define do
  factory :homework_meta_progress, class: Homework::Meta::Progress do
    tasks{[build(:homework_meta_task)]}
  end
end
FactoryGirl.define do
  factory :homework_meta_task, class: Homework::Meta::Task do
    description 'this is meta for task'
    subtasks {[build(:homework_meta_text), build(:homework_meta_table)]}
  end
end
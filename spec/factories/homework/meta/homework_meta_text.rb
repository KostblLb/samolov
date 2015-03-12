FactoryGirl.define do
  factory :homework_meta_text, class: Homework::Meta::Subtask::Text do
    task_class 'Text'
    description 'this is meta for simple task'
  end
end
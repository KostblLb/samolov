FactoryGirl.define do
  factory :homework_subtask_text, class: Homework::Subtask::Text do
      association :meta, factory: :homework_meta_text
  end
end
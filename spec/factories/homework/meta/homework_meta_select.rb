FactoryGirl.define do
  factory :homework_meta_select,  class: Homework::Meta::Subtask::Select do
    options {[build(:homework_meta_option),build(:homework_meta_option)]}
  end
end

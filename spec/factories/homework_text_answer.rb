FactoryGirl.define do
  factory :text_answer, :class => Homework::TextAnswer do
    association :homework_progress
  end
end
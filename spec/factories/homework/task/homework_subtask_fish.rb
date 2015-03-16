FactoryGirl.define do
  factory :homework_subtask_fish, class: Homework::Subtask::Fish do
      association :meta, factory: :homework_meta_fish
  end
end
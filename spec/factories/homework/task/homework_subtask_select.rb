FactoryGirl.define do
  factory :homework_subtask_select, class: Homework::Subtask::Select do


    association :meta, factory: :homework_meta_select

  end
end

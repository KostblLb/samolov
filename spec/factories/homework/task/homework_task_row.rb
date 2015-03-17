FactoryGirl.define do
  factory :homework_subtask_row, class: Homework::Subtask::Row do

    cells ['a','b','c']

    association :meta, factory: :homework_meta_row

  end
end
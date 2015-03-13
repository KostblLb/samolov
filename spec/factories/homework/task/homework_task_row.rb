FactoryGirl.define do
  factory :homework_subtask_row, class: Homework::Subtask::Row do
    association :meta, factory: :homework_meta_row
    cells [nil,nil]

  end
end
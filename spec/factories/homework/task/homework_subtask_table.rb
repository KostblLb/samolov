FactoryGirl.define do
  factory :homework_subtask_table, class: Homework::Subtask::Table do
    rows [build(:homework_subtask_row)]
  end
end
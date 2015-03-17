FactoryGirl.define do
  factory :homework_subtask_table, class: Homework::Subtask::Table do
    rows {[build(:homework_subtask_row), build(:homework_subtask_row)]}

    association :meta, factory: :homework_meta_table_without_rows
  end
end
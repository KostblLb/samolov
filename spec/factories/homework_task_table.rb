FactoryGirl.define do
  factory :homework_task_table, class: Homework::Subtask::Table do
    rows{build_list(:homework_task_row, 2)}
    col_names ['a','b','c']
  end
end
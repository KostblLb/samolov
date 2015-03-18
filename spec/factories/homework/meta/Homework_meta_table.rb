FactoryGirl.define do
  factory :homework_meta_table, class: Homework::Meta::Subtask::Table do
    description 'this is meta for task with table'
    task_class 'Table'
    col_names ['a','b','c']
    meta_rows {build_list(:homework_meta_row, 2)}
  end

  factory :homework_meta_table_without_rows, class: Homework::Meta::Subtask::Table do
    description 'this is meta for task with table'
    task_class 'Table'
    col_names ['a', 'b', 'c']
  end
end
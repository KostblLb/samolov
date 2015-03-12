FactoryGirl.define do
  factory :homework_subtask_row, class: Homework::Subtask::Row do
    name 'row'
    cells [nil,nil,nil]
    colspan 3
    rowspan 5
  end
end
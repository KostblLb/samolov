FactoryGirl.define do
  factory :homework_meta_row,  class: Homework::Meta::Subtask::Row do
    colspan 3
    rowspan 5
    name 'row'
    meta_cells [nil,nil]
  end
end

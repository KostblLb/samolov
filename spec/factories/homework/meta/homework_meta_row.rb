FactoryGirl.define do
  factory :homework_meta_row,  class: Homework::Meta::Subtask::Row do
    name 'this is row'
    meta_cells [nil,nil]
  end
end

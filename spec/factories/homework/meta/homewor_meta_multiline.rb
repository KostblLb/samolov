FactoryGirl.define do
  factory :homework_meta_multiline,  class: Homework::Meta::Subtask::Multiline do
    line_names ['1','2']
    lines [nil,nil]
  end
end

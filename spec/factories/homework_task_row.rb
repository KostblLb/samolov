FactoryGirl.define do
  factory :homework_task_row, class: Homework::Task::Subtask::Row do
    name 'row'
    cells [nil,nil,nil]
  end
end
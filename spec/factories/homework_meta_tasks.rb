FactoryGirl.define do
  factory :meta_task, class: Homework::MetaTask do
    task_class 'TextAnswer'
  end

end
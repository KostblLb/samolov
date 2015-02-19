FactoryGirl.define do
  factory :homework_meta, :class => Homework::HomeworkMeta do

    meta_tasks{[build(:meta_task),build(:meta_task)]}
  end
end
FactoryGirl.define do
  factory :homework_meta, :class => Homework::Meta::Base do

    meta_task{build(:meta_task)}
  end
end
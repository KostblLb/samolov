FactoryGirl.define do
  factory :progress, :class => Homework::Progress do
    homework_meta {build :homework_meta}
  end
end
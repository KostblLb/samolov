FactoryGirl.define do
  factory :course do
    sequence(:name) {|n| "course#{n}"}
    description "MyString"
    transient do
      parts_count 2
    end
    after(:create) do |course, evaluator|
      create_list(:part, evaluator.parts_count, course: course)
    end
  end
end

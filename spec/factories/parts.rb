FactoryGirl.define do
  factory :part do
    name "MyString"
    position 1
    association :course
    transient do
      units_count 2
    end
    after(:create) do |part, evaluator|
      create_list(:unit, evaluator.units_count, part: part)
    end
  end

  factory :empty_part, class: Part do
    name "MyString"
    position 1
  end
end

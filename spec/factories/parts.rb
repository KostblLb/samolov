FactoryGirl.define do
  # factory :part do
  #   name "MyString"
  #   position 1
  #   association :course
  #   transient do
  #     units_count 2
  #   end
  #   after(:create) do |part, evaluator|
  #     create_list(:unit, evaluator.units_count, part: part)
  #   end
  # end

  factory :part do
    name "MyString"
    units {[build(:empty_unit), build(:exam)]}
  end

  factory :empty_part, class: Part do
    name "MyString"
    units {[build(:empty_unit), build(:empty_unit2)]}
  end

  factory :part_with_exam, class: Part do
    name "MyString"
    units {[build(:exam), build(:exam)]}
  end
end

FactoryGirl.define do

  factory :course do
    sequence(:name) {|n| "course#{n}"}
    description "MyString"
    parts {[build(:empty_part, position:1), build(:empty_part, position:2)]}
  end

  factory :empty_course, class: Course do
    sequence(:name) {|n| "course#{n}"}
    description "MyString"
    parts {[build(:empty_part, position:1), build(:empty_part, position:2)]}
  end

  factory :course_with_exam, class: Course do
    sequence(:name) {|n| "course#{n}"}
    description "MyString"
    parts {[build(:part_with_exam, position:1), build(:part_with_exam, position:2)]}
  end

end

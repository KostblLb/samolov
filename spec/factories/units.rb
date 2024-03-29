FactoryGirl.define do
  factory :unit do
    name "MyString"
    video_link "MyString"
    summary "MyString"
    part {Part.new}
    association :quiz, factory: :quiz
    association :case, factory: :quiz
    association :homework_meta, factory: :homework_meta_progress
  end

  factory :exam, class: Unit do
    name "MyString"
    part {Part.new}
    association :quiz, factory: :quiz
    association :case, factory: :quiz
    association :homework_meta, factory: :homework_meta_progress
    is_exam true
  end

  factory :unit_without_part, class: Unit do
    name "MyString"
    video_link "MyString"
    summary "MyString"
    part {Part.new}
    association :quiz, factory: :quiz
    association :case, factory: :quiz
    association :homework_meta, factory: :homework_meta_progress
  end

  factory :empty_unit, class: Unit do
    name "MyString"
    association :quiz, factory: :quiz
    association :case, factory: :quiz
    association :homework_meta, factory: :homework_meta_progress
    position 1
  end

  factory :unit_with_empty_quiz, class: Unit do
    name "MyString"
    association :quiz, factory: :empty_quiz
    association :case, factory: :empty_quiz
    association :homework_meta, factory: :homework_meta_progress
    position 1
  end

  factory :empty_unit2, class: Unit do
    name "MyString"
    association :quiz, factory: :quiz
    association :case, factory: :quiz
    association :homework_meta, factory: :homework_meta_progress
    position 2
  end
end

FactoryGirl.define do
  factory :unit do
    name "MyString"
    video_link "MyString"
    summary "MyString"
    association :part
    association :quiz, factory: :quiz
    association :case, factory: :quiz
    association :homework_meta, factory: :homework_meta_progress
  end

  factory :exam, class: Unit do
    name "MyString"
    association :part
    association :quiz, factory: :quiz
    association :case, factory: :quiz
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
    webinar { build(:webinar) }
    position 1
  end

  factory :empty_unit2, class: Unit do
    name "MyString"
    association :quiz, factory: :quiz
    association :case, factory: :quiz
    association :homework_meta, factory: :homework_meta_progress
    webinar { build(:webinar2) }
    position 2
  end
end

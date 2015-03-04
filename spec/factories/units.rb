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
end

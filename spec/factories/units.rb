FactoryGirl.define do
  factory :unit do
    name "MyString"
    video_link "MyString"
    summary "MyString"
    association :part
    association :quiz, factory: :quiz
    association :case, factory: :quiz
    homework{build :homework_meta}
  end
end

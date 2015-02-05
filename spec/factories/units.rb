FactoryGirl.define do
  factory :unit do
    name "MyString"
    video_link "MyString"
    summary "MyString"
    association :part
    association :test, factory: :quiz
    association :case, factory: :quiz
  end
end

FactoryGirl.define do
  factory :unit do
    name "MyString"
    video_link "MyString"
    summary "MyString"
    association :part
    association :quiz, factory: :quiz
    association :case, factory: :quiz
    homework_metas{build_list(:homework_meta, 1)}
  end
end

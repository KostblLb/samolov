FactoryGirl.define do
  factory :quiz do
    name 'New quiz'
    questions {[build(:question), build(:question)]}
  end

  factory :empty_quiz, class: Quiz do
    name 'New quiz'
  end
end

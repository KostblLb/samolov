FactoryGirl.define do
  factory :quiz do
    questions {[build(:question), build(:question)]}
  end
end

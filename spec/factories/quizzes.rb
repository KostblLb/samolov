FactoryGirl.define do
  factory :quiz do
    name 'New quiz'
    questions {[build(:question), build(:question)]}
  end
end

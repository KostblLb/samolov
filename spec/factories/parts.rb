FactoryGirl.define do
  factory :part do
    name "MyString"
    association :course
  end
end

FactoryGirl.define do
  factory :order do
    cost nil
    association :user
    association :course
  end
end

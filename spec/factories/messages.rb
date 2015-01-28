FactoryGirl.define do
  factory :message do
    body "MyText"

    association :sender, factory: :user
    association :recipient, factory: :user
  end
end

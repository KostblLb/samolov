FactoryGirl.define do
  factory :message do
    body "MyText"

    association :sender, factory: :user
  end
end

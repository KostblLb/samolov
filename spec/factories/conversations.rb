FactoryGirl.define do
  factory :conversation do
    users {[create(:user), create(:user), create(:user)]}

    after :create do |conv|
      conv.messages << build(:message, sender: conv.users.first)
      conv.messages << build(:message, sender: conv.users.first)
      conv.save!
    end
  end

end

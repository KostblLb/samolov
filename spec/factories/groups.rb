FactoryGirl.define do
  factory :group do
    association :teacher, factory: :user
    association :course
    students {[create(:user)]}
  end
end

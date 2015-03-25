FactoryGirl.define do
  factory :group do
    education_beginning Date.new(2015,1,1)
    association :teacher, factory: :user
    association :course
    students {[create(:user)]}
  end
end

FactoryGirl.define do
  factory :question do
    text 'Question text'
    answers {[(create :answer)]}
  end
end

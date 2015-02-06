FactoryGirl.define do
  factory :question do
    text 'Question text'
    answers {[(build :answer)]}
  end
end

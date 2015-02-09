FactoryGirl.define do
  factory :question do
    text 'Question text'
    answers {[(build :answer), (build :answer, is_correct: true)]}
    quiz {Quiz.create}
  end
end

class QuizSerializer < ActiveModel::Serializer
  attributes :id, :test_name, :question_text, :answer_ids
end
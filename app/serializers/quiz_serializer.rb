class QuizSerializer < ActiveModel::Serializer
  attributes :id, :name, :question_ids
end
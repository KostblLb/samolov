class QuizSerializer < ActiveModel::Serializer
  attributes :id, :name, :unit_id, :question_ids
end
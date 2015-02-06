class QuizProgressSerializer < ActiveModel::Serializer
  attributes :id, :current_question_id
end

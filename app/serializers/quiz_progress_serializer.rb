class QuizProgressSerializer < ActiveModel::Serializer
  attributes :id, :current_question_id, :quiz_id, :correct_answers_count, :points
end

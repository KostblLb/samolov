class UserAnswerSerializer < ActiveModel::Serializer
  attributes :id, :quiz_progress_id, :is_correct, :answer_ids
end

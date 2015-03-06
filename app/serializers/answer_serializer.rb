class AnswerSerializer < ActiveModel::Serializer
  attributes :id, :text, :is_correct

  def is_correct
    if @object.question.user_has_answer? @scope
      @object.is_correct
    else
      nil
    end
  end
end

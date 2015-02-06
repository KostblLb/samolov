class QuizSerializer < ActiveModel::Serializer
  attributes :id, :name, :question_ids, :my_progress_id

  def my_progress_id
    QuizProgress.where(user: @scope, quiz: @object).first.try :id
  end
end
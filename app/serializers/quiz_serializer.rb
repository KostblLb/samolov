class QuizSerializer < ActiveModel::Serializer
  attributes :id, :name, :question_ids, :my_progress_id

  has_many :questions
  has_one :my_progress

  def my_progress_id
    QuizProgress.where(user: @scope, quiz: @object).first.try :id
  end

  def my_progress
    QuizProgress.where(user: @scope, quiz: @object).first
  end


end
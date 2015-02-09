class QuestionSerializer < ActiveModel::Serializer
  attributes :id, :text, :right_answers_count

  has_many :answers

  has_one :my_answer, serializer: UserAnswerSerializer

  def my_answer
    my_progress = QuizProgress.where(user_id: @scope.id, quiz_id: @object.quiz.id).first
    UserAnswer.where(quiz_progress: my_progress.id, question_id: @object.id).first
  end
end
class QuestionSerializer < ActiveModel::Serializer
  attributes :id, :text, :right_answers_count

  has_many :answers
  has_many :correct_answers
  has_many :my_answers, serializer: UserAnswerSerializer

  def my_answers
    my_progress = QuizProgress.where(user_id: @scope.id, quiz_id: @object.quiz.id).first
    if my_progress.finished?
      UserAnswer.where(quiz_progress: my_progress.id, question_id: @object.id)
    else
      []
    end
  end

  def correct_answers
    my_progress = QuizProgress.where(user_id: @scope.id, quiz_id: @object.quiz.id).first
    if my_progress.finished?
      answers.right
    else
      []
    end
  end
end
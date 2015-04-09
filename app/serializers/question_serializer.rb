class QuestionSerializer < ActiveModel::Serializer
  attributes :id, :text, :right_answers_count, :preview_image_url, :number

  has_many :answers
  has_many :correct_answers

  has_one :my_answer, serializer: UserAnswerSerializer

  def preview_image_url
    @object.preview_image.exists? ? @object.preview_image.url : nil
  end

  def number
    if @scope.is_a? User
      QuizProgress.where(user_id: @scope.id, quiz_id: @object.quiz.id).first.current_question_number
    else
      nil
    end
  end

  def my_answer
    my_progress = QuizProgress.where(user_id: @scope.id, quiz_id: @object.quiz.id).first
    if my_progress
      UserAnswer.where(quiz_progress: my_progress.id, question_id: @object.id).first
    else
      nil
    end
  end

  def correct_answers
    my_progress = QuizProgress.where(user_id: @scope.id, quiz_id: @object.quiz.id).first
    if (my_progress && my_progress.finished?) || @scope.teacher?
      answers.right
    else
      []
    end
  end
end
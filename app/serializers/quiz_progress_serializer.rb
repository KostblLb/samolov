class QuizProgressSerializer < ActiveModel::Serializer
  attributes :id, :current_question_id, :quiz_id, :correct_answers_count, :points, :unit_id, :is_quiz

  def unit_id
    if @object.quiz.quiz_socket
      @object.quiz.quiz_socket.id.to_s
    else
      @object.quiz.case_socket.id.to_s
    end
  end

  def is_quiz
    if @object.quiz.quiz_socket
      true
    else
      false
    end
  end
end

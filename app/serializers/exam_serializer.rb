class ExamSerializer < ActiveModel::Serializer
  attributes :id, :name, :unit_id, :question_ids, :type

  def type
    if :is_exam
      'test'
    else
      'case'
    end
  end
end
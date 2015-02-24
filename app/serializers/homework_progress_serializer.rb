class HomeworkProgressSerializer < ActiveModel::Serializer
  attributes :id, :student, :teacher, :order, :max_points, :points, :mistakes_counter, :correct_answer_counter, :text_answers, :table_answers
end
class Homework::ProgressSerializer < ActiveModel::Serializer
  attributes :id,:max_points, :points, :mistakes_counter, :correct_answer_counter, :total_tasks
  has_many :tasks
end
class Homework::ProgressSerializer < ActiveModel::Serializer
  attributes :id,:max_points, :points, :mistakes_counter, :correct_answer_counter, :total_tasks, :status
  has_many :tasks

  def status
    @object.state
  end
end
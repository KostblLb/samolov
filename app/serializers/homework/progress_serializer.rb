class Homework::ProgressSerializer < ActiveModel::Serializer
  attributes :id,:max_points, :points, :mistakes_counter, :correct_answer_counter, :total_tasks, :state, :is_complete
  has_many :tasks

  def is_complete
    return @object.state!='in_progress'
  end
end
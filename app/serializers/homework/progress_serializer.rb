class Homework::ProgressSerializer < ActiveModel::Serializer
  attributes :id,:max_points, :points, :mistakes_counter, :correct_answer_counter, :total_tasks, :status, :is_complete
  has_many :tasks

  def status
    @object.state
  end

  def is_complete
    return @object.state!='in_progress'
  end
end
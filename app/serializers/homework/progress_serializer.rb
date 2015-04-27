class Homework::ProgressSerializer < ActiveModel::Serializer
  attributes :id,:max_points, :points, :mistakes_count, :correct_answer_counter, :total_tasks, :state, :is_complete, :is_available, :unit_id
  has_many :tasks

  def is_complete
    return @object.state!='in_progress'
  end

  def is_available
    return true
  end

  def unit_id
    @object.unit_progress.unit.id.to_s
  end


end
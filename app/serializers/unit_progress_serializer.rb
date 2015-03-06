class UnitProgressSerializer < ActiveModel::Serializer
  attributes :id, :state, :points, :max_points, :user_id, :unit_id, :homework_progress_id

  def state
    @object.state.to_s
  end

  def homework_progress_id
    @object.homework_progress.try(:id)
  end



end
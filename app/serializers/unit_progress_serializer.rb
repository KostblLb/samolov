class UnitProgressSerializer < ActiveModel::Serializer
  attributes :id, :state, :points, :max_points, :user_id

  def state
    @object.state.to_s
  end
end
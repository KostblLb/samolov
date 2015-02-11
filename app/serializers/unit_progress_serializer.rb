class UnitProgressSerializer < ActiveModel::Serializer
  attributes :id, :state

  def state
    @object.state.to_i
  end
end
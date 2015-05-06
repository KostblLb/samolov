class UserSerializer < UserWithoutFriendsSerializer
  has_many :friends, serializer: UserWithoutFriendsSerializer
  has_one :subscribtion
  def friends
    if @object == @scope
      @object.friends
    else
      []
    end
  end
end

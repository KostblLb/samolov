class UserSerializer < UserWithoutFriendsSerializer
  has_many :friends, serializer: UserWithoutFriendsSerializer

  def friends
    if @object == @scope
      @object.friends
    else
      []
    end
  end
end

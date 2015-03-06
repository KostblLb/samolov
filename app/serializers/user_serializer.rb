class UserSerializer < UserWithoutFriendsSerializer
  has_many :friends, serializer: UserWithoutFriendsSerializer
end

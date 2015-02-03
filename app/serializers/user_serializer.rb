class UserSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :email, :avatar_url, :is_teacher

  def avatar_url
    @object.avatar.url
  end
end

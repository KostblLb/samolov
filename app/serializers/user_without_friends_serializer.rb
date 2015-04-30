class UserWithoutFriendsSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :email, :avatar_url, :is_teacher, :birthday, :city, :country, :phone, :skype,
             :company_name, :job_title, :vk_link, :fb_link, :gplus_link, :ln_link, :tw_link, :unreads_messages_count, :small_avatar_url

  def avatar_url
    @object.avatar.url
  end
  def small_avatar_url
    @object.avatar.url(:default)
  end
end

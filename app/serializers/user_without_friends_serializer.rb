class UserWithoutFriendsSerializer < ActiveModel::Serializer
<<<<<<< HEAD
    attributes :id, :first_name, :last_name, :email, :avatar_url, :is_teacher, :birthday, :city, :country, :phone, :skype,
               :company_name, :job_title, :vk_link, :fb_link, :gplus_link, :ln_link, :tw_link, :unreads_messages_count

    def avatar_url
      @object.avatar.url
    end
  end
=======
  attributes :id, :first_name, :last_name, :email, :avatar_url, :is_teacher, :birthday, :city, :country, :phone, :skype,
             :company_name, :job_title, :vk_link, :fb_link, :gplus_link, :ln_link, :tw_link, :unreads_messages_count

  def avatar_url
    @object.avatar.url
  end
end
>>>>>>> 66600f676c208ea67ec77d8c655b6efe41e374d1

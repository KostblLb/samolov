class UserWithoutFriendsSerializer < ActiveModel::Serializer
    attributes :id, :first_name, :last_name, :email, :avatar_url, :is_teacher, :birthday, :city, :country, :phone, :skype,
               :company_name, :job_title, :vk_link, :fb_link, :gplus_link, :ln_link, :tw_link, :unreads_messages_count

    def avatar_url
      @object.avatar.url
    end
  end

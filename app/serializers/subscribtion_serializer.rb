class SubscribtionSerializer < ActiveModel::Serializer
  attributes :id, :new_message, :new_advert, :new_event, :module_start, :user_id
end
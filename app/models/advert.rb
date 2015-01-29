class Advert
  include Mongoid::Document

  field :title
  field :text

  embedded_in :group
end
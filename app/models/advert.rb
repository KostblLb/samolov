class Advert
  include Mongoid::Document

  field :title
  field :text

  embedded_in :group

  after_create :send_notification

  private
  def send_notification
    AdvertMailerWorker.perform(group, title, text)
  end

end
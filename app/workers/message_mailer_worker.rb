class MessageMailerWorker
  include Sidekiq::Worker

  def self.perform(user, sender, text)
    if user.subscribtion.new_message
      EventMailer.send_mail('Директорский курс. Новое сообщение', user, "Здравствуйте, у вас новое сообщение, отправитель #{sender.name}:
      <p>#{text}</p>")
    end
  end

end

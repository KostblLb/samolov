class MessageMailerWorker
  include Sidekiq::Worker

  def perform(user, sender, text)
    if user.subscribtion.new_message
      EventMailer.send_mail('Директорский курс. Новое сообщение', user, message_body(sender, text)).deliver_now
    end
  end

  def message_body(sender, text)
    "Здравствуйте, у вас новое сообщение, отправитель #{sender.name}:
    <p>#{text}</p>"
  end
end

class EventMailer < ActionMailer::Base

  def send_mail(subject, user, text)
    mail to: user.email, subject: subject, body: text, content_type: "text/html"
  end

  def delivery(subject, bcc, text)
    mail to: 'subscription@samolov.ru', subject: subject, body: text, bcc: bcc, content_type: "text/html"
  end
end
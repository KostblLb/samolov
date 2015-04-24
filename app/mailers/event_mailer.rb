class EventMailer < ActionMailer::Base

  def send_mail(subject, user, text)
    mail to: user.email, subject: subject, body: text, content_type: "text/html"
  end

end
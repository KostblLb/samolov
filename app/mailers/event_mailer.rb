class EventMailer < ActionMailer::Base

  def upcoming_event(user, text)
    mail to: user.email, subject: 'Не пропустите', body: text
  end

end
class InquireMailer < ActionMailer::Base

  def send_mail(subject, inquire)
    mail to: 'kurs@samolov.ru', subject: subject, body: body(inquire), content_type: "text/html"
  end

  def body(inquire)
    "Добавлена новая заявка.Имя #{inquire.name}, телефон #{inquire.phone}, email #{inquire.email}"
  end

end

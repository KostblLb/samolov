class AdvertMailerWorker
  include Sidekiq::Worker

  def perform(group, title, text)
    group.students.each do |student|
      if student.subscribtion.new_advert
        EventMailer.send_mail('Директорский курс. Новое объявление.',student, advert_body(group.name ,student, title, text)).deliver_now
      end
    end
  end


  def advert_body(group, student, title, text)
    "Здравствуйте #{student.name}. Новое объявление для группы #{group}: <br>
    <h2>#{title}</h2>
    <p>#{text}</p>"
  end
end

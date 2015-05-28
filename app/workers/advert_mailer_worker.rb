class AdvertMailerWorker
  include Sidekiq::Worker

  def self.perform(group, title, text)
    group.students.each do |student|
      if student.subscribtion.new_advert
        EventMailer.send_mail('Директорский курс. Новое объявление.',student, "Здравствуйте #{student.name}. Новое объявление для группы #{group.name}: <br>
    <h2>#{title}</h2>
    <p>#{text}</p>")
      end
    end
  end

end

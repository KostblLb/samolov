class EventMailerWorker
  include Sidekiq::Worker

  def perform
    UnitProgress.each do |current|
      if current.deadline > Date.today
        if current.user.subscribtion.new_event
          event = current.unit.is_exam ? tommorow_event_exam(current) : tommorow_event(current)
          EventMailer.send_mail('Директорский курс. Не пропустите '+event+'!', current.user, event_body_create(current, event)).deliver_now unless event.nil?
        end
      end
      if current.schedule.start_date == Date.today - 1
        if current.user.subscribtion.module_start
          EventMailer.send_mail('Директорский курс. Завтра начинаетя модуль '+current.unit.name, current.user, unit_start_body(current)).deliver_now
        end
      end
    end
    Webinar.each do |current|
      if current.start == DateTime.now - 1.hour
        bcc=[]
        current.unit_schedule.group.students.rach do |student|
          if student.subscribtion.new_event
            bcc<<student.email
          end
        end
        if bcc!=[]
          EventMailer.delay(send_mail('Директорский курс. Вебинар начинается через час.', bcc,
                                "Здравствуйте, чрез час начинается вебинар в модуле #{current.unit_schedule.unit.name}. Не пропустите!")).deliver_now
        end
      end
    end
  end

  def unit_start_body(progress)
    "Здравствуйте, #{progress.user.name}. Вы проходите курс #{progress.course_part_progress.course_progress.course.name}.
     Завтра по расписанию начинается модуль #{progress.unit.name}. Не пропустите!"
  end

  def event_body_create(progress, event)
    "Здравствуйте, #{progress.user.name}. Вы проходите курс #{progress.course_part_progress.course_progress.course.name}.
     Завтра по расписанию начинается #{event} в модуле #{progress.unit.name}. Не пропустите!"
  end

  def tommorow_event(progress)
    case Date.today
      when progress.unit_beginning - 1
        return 'видео'
      when progress.video_deadline - 1
        return 'тест'
      when progress.quiz_deadline - 1
        return 'конспект'
      when progress.summary_deadline - 1
        return 'кейс'
      when progress.case_deadline - 1
        return 'вебинар'
      when progress.webinar_deadline - 1
        return 'домашнее задание'
      else
        return nil
    end
  end

  def tommorow_event_exam(progress)
    case Date.today
      when progress.unit_beginning - 1
        return 'Экзаминационный тест'
      when progress.case_deadline - 1
        return 'Экзаменационная Скайп-игра'
      else
        return nil
    end
  end


end

class EventMailerWorker
  include Sidekiq::Worker

  def perform
    UnitProgress.each do |current|
      if current.deadline > Date.today
        event = current.unit.is_exam ? tommorow_event_exam(current) : tommorow_event(current)
        EventMailer.upcoming_event(current.user, body_create(current, event)).deliver_now unless event.nil?
      end
    end
  end

  def body_create(progress, event)
    "Здравствуйте, #{progress.user.name}. Вы проходите курс #{progress.course_part_progress.course_progress.course.name}.
     Завтра по расписанию начинается #{event} в модуле #{progress.unit.name}. Не пропустите!"
  end

  def tommorow_event(progress)
    case Date.today
      when progress.unit_beginning - 1
        return 'Видео'
      when progress.video_deadline - 1
        return 'Тест'
      when progress.quiz_deadline - 1
        return 'Конспект'
      when progress.summary_deadline - 1
        return 'Кейс'
      when progress.case_deadline - 1
        return 'Вебинар'
      when progress.webinar_deadline - 1
        return 'Домашнее задание'
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

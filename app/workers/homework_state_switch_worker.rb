class HomeworkStateSwitchWorker
  include Sidekiq::Worker

  def perform
    UnitProgress.each do |current|
      if current.homework_deadline <= DateTime.now - 7.day
        current.homework_progress.update(state_event: 'complete')
      end
    end
  end
end

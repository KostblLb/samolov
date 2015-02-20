module Homework
  module Task
    class Table < Base
      embeds_many :rows, class_name: 'Homework::Task::Row'
      embedded_in :progress, class_name: 'Homework::Progress'
    end
  end
end
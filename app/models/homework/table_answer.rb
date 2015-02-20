module Homework
  class TableAnswer < TaskBase
    embeds_many :rows, class_name: 'Homework::Row'
    embedded_in :progress, class_name: 'Homework::Progress'
  end
end
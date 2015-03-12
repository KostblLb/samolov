Samolov.HomeworkProgress = DS.Model.extend

  points: DS.attr 'number'
  mistakes_counter: DS.attr 'number'
  correct_answer_counter: DS.attr 'number'
  totalTasks: DS.attr 'number'
  status: DS.attr 'string'
  tasks: DS.hasMany 'task'

  isComplete:->
    if status=='in_progress'
      true
    else
      false



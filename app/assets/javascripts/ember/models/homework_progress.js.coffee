Samolov.HomeworkProgress = DS.Model.extend

  points: DS.attr 'number'
  mistakes_counter: DS.attr 'number'
  correct_answer_counter: DS.attr 'number'
  totalTasks: DS.attr 'number'
  status: DS.attr 'string'
  tasks: DS.hasMany 'tasks', polymorphic: true
  isComplete:  DS.attr 'boolean'



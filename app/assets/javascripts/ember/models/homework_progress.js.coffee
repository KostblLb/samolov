Samolov.HomeworkProgress = DS.Model.extend

  points: DS.attr 'number'
  mistakes_counter: DS.attr 'number'
  correct_answer_counter: DS.attr 'number'
  totalTasks: DS.attr 'number'
  tasks: DS.hasMany 'tasks', polymorphic: true


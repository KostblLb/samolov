Samolov.HomeworkProgress = DS.Model.extend

  points: DS.attr 'number'
  mistakes_counter: DS.attr 'number'
  correct_answer_counter: DS.attr 'number'
  totalTasks: DS.attr 'number'
  state: DS.attr 'string'
  tasks: DS.hasMany 'task'
  isComplete:  DS.attr 'boolean'

  hpn:(->
    "partials/homework/#{@get 'state'}"
  ).property('state')

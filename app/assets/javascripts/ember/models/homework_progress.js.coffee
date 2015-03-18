Samolov.HomeworkProgress = DS.Model.extend

  points: DS.attr 'number'
  mistakes_counter: DS.attr 'number'
  correct_answer_counter: DS.attr 'number'
  totalTasks: DS.attr 'number'
  state: DS.attr 'string'
  tasks: DS.hasMany 'task'
  isComplete:  DS.attr 'boolean'
  isAvailable: DS.attr 'boolean'
  unitId: DS.attr 'string'
  unitState: DS.attr 'string'

  isSaved: false

  hpn:(->
    "partials/homework/#{@get 'state'}"
  ).property('state')


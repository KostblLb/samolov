Samolov.HomeworkProgress = DS.Model.extend

  points: DS.attr 'number'
  mistakesCounter: DS.attr 'number'
  correctAnswerCounter: DS.attr 'number'
  totalTasks: DS.attr 'number'
  state: DS.attr 'string'
  tasks: DS.hasMany 'task'
  isComplete:  DS.attr 'boolean'
#  isAvailable: DS.attr 'boolean'
  unitId: DS.attr 'string'
  unitState: DS.attr 'string'

  isSaved: false
  isReviewSaved: false

  hpn:(->
    "partials/homework/#{@get 'state'}"
  ).property('state')

  isNotVerified:(->
    @get('state') != 'verified'
  ).property('state')

  isAvailable: (->
    @get('unitState') == 'homework'
  ).property('unitState')

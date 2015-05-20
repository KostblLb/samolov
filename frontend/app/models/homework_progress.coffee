`import DS from "ember-data";`

HomeworkProgress = DS.Model.extend

  states: ['in_progress', 'review', 'verified']
  state:                DS.attr 'string'
  stateEvent:           DS.attr 'string'
  points:               DS.attr 'number'
  mistakesCounter:      DS.attr 'number'
  correctAnswerCounter: DS.attr 'number'
  totalTasks:           DS.attr 'number'

  tasks:                DS.hasMany 'task'
  isComplete:           DS.attr 'boolean'
#  isAvailable: DS.attr 'boolean'
  unitId:               DS.attr 'string'
  unitState:            DS.attr 'string'

  isSaved: false
  isReviewSaved: false

  hpn:(->
    "partials/homework/#{@get 'state'}"
  ).property('state')

  isNotVerified:(->
    @get('state') != 'verified'
  ).property('state')

  isVerified:(->
    @get('state') == 'verified'
  ).property('state')

  isAvailable: (->
    @get('unitState') == 'homework' || @get('unitState') == 'done'
  ).property('unitState')

  allTasksIsComplete: (->
    @get('tasks').filterBy('allSubtasksIsFilled', false).length == 0
  ).property('tasks.@each.allSubtasksIsFilled')


`export default HomeworkProgress;`

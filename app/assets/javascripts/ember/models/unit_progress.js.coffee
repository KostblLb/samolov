Samolov.UnitProgress = DS.Model.extend Samolov.ProgressMixin,
  states: ['video', 'quiz', 'summary', 'case', 'webinar', 'homework']
  state:      DS.attr 'string'
  stateEvent: DS.attr 'string'
  isExam:     DS.attr 'boolean'
  hpid:       DS.attr 'string'

  unit:             DS.belongsTo 'unit'#, async: true
  user:             DS.belongsTo 'user'
  homeworkProgress: DS.belongsTo 'homework_progress', async: true
  quizProgress:     DS.belongsTo 'quiz_progress',     async: true
  caseProgress:     DS.belongsTo 'quiz_progress',     async: true

  stepIsComplite: (step) ->
    @states.indexOf(step) < @states.indexOf(@get 'state')

  stepIsActive: (step) ->
    @states.indexOf(step) == @states.indexOf(@get 'state')

  stepIsAvailable: (step) ->
    @states.indexOf(step) <= @states.indexOf(@get 'state')

  videoIsComplete: (->
    @stepIsComplite 'video'
  ).property('state')

  quizIsComplete: (->
    @stepIsComplite 'quiz'
  ).property('state')

  summaryIsComplete: (->
    @stepIsComplite 'summary'
  ).property('state')

  caseIsComplete: (->
    @stepIsComplite 'case'
  ).property('state')

  webinarIsComplete: (->
    @stepIsComplite 'webinar'
  ).property('state')

  homeworkIsComplete: (->
    @stepIsComplite 'homework'
  ).property('state')

  quizIsActive: (->
    @stepIsActive 'quiz'
  ).property('state')

  summaryIsAvailable: (->
    @stepIsAvailable 'summary'
  ).property('state')

  webinarIsAvailable: (->
    @stepIsAvailable 'webinar'
  ).property('state')





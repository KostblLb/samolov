Samolov.UnitProgress = DS.Model.extend Samolov.ProgressMixin,
  states: ['video', 'quiz', 'summary', 'case', 'webinar', 'homework']
  state: DS.attr 'string'
  unit: DS.belongsTo 'unit'#, async: true
  user: DS.belongsTo 'user'

  stepIsComplite: (step) ->
    @states.indexOf(step) < @states.indexOf(@get 'state')

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





Samolov.UnitProgress = DS.Model.extend Samolov.FormattedDeadlineMixin, Samolov.ProgressMixin,
  states: ['disabled', 'video', 'quiz', 'summary', 'case', 'webinar', 'homework', 'done']

  state:                  DS.attr 'string'
  stateEvent:             DS.attr 'string'
  isExam:                 DS.attr 'boolean'
  hpid:                   DS.attr 'string'
  webinarScore:           DS.attr 'number'
  deadline:               DS.attr 'string'
  videoDeadline:          DS.attr 'string'
  quizDeadline:           DS.attr 'string'
  summaryDeadline:        DS.attr 'string'
  caseDeadline:           DS.attr 'string'
  webinarDeadline:        DS.attr 'string'
  homeworkDeadline:       DS.attr 'string'
  unitBeginning:          DS.attr 'string'
  homeworkProgressPoints: DS.attr 'string'
  homeworkProgressState:  DS.attr 'string'
  caseProgressPoints:     DS.attr 'string'
  quizProgressPoints:     DS.attr 'string'

  unit:                DS.belongsTo 'unit'#, async: true
  user:                DS.belongsTo 'user', async: true
  homeworkProgress:    DS.belongsTo 'homework_progress', async: true
  quizProgress:        DS.belongsTo 'quiz_progress',     async: true
  caseProgress:        DS.belongsTo 'quiz_progress',     async: true

  format: 'DD MMMM'

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

  isAvailable: (->
    @get('state') != 'disabled'
  ).property('state')

  quizIsAvailable: (->
    @stepIsAvailable 'quiz'
  ).property('state')

  summaryIsAvailable: (->
    @stepIsAvailable 'summary'
  ).property('state')

  caseIsAvailable: (->
    @stepIsAvailable 'case'
  ).property('state')

  webinarIsAvailable: (->
    @stepIsAvailable 'webinar'
  ).property('state')

  homeworkIsAvailable: (->
    @stepIsAvailable 'homework'
  ).property('state')

  convertDate: (field) ->
    date = @.get field
    format = @.get 'format'
    moment(date).format format

  formattedVideoDeadline: (->
    @convertDate 'videoDeadline'
  ).property('videoDeadline', 'format')

  formattedQuizDeadline: (->
    @convertDate 'quizDeadline'
  ).property('quizDeadline', 'format')

  formattedSummaryDeadline: (->
    @convertDate 'summaryDeadline'
  ).property('summaryDeadline', 'format')

  formattedCaseDeadline: (->
    @convertDate 'caseDeadline'
  ).property('caseDeadline', 'format')

  formattedWebinarDeadline: (->
    @convertDate 'webinarDeadline'
  ).property('webinarDeadline', 'format')

  formattedHomeworkDeadline: (->
    @convertDate 'homeworkDeadline'
  ).property('homeworkDeadline', 'format')

  formattedUnitBeginning: (->
    @convertDate 'unitBeginning'
  ).property('unitBeginning', 'format')





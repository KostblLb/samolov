`import DS from "ember-data";`
`import FormattedDeadlineMixin from "../mixins/formatted_deadline_mixin"`
`import ProgressMixin from "../mixins/progress_mixin"`


UnitProgress = DS.Model.extend FormattedDeadlineMixin, ProgressMixin,
  states: ['video', 'quiz', 'summary', 'case', 'webinar', 'homework', 'done']

#  state:                  DS.attr 'string'
#  stateEvent:             DS.attr 'string'
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

  videoComplete:     DS.attr 'boolean'
  quizComplete:      DS.attr 'boolean'
  summaryComplete:   DS.attr 'boolean'
  caseComplete:      DS.attr 'boolean'
  webinarComplete:   DS.attr 'boolean'
  homeworkComplete:  DS.attr 'boolean'

  unit:                DS.belongsTo 'unit'#, async: true
  user:                DS.belongsTo 'user'#, async: true
  homeworkProgress:    DS.belongsTo 'homework_progress', async: true
  quizProgress:        DS.belongsTo 'quiz_progress',     async: true
  caseProgress:        DS.belongsTo 'quiz_progress',     async: true
  coursePartProgress:  DS.belongsTo 'course_part_progress', async: true
  webinar:             DS.belongsTo 'webinar'

  format: 'DD MMMM'

  stepIsComplite: (step) ->
    @get("#{step}Complete")

  stepIsActive: (step) ->
    true

  momentDate: ->
    moment()

  isAvailable: (->
    moment(@get('unitBeginning')) <= moment()
  ).property('unitBeginning', 'momentDate')


  quizIsAvailable: (->
    moment(@get('coursePartProgress.content.deadline')) >= moment()
  ).property('coursePartProgress.content.deadline','momentDate')

  videoIsComplete: (->
    @get('videoComplete')
  ).property('videoComplete')

  quizIsComplete: (->
    @get('quizComplete')
  ).property('quizComplete')

  summaryIsComplete: (->
    @get('summaryComplete')
  ).property('summaryComplete')

  caseIsComplete: (->
    @get('caseComplete')
  ).property('caseComplete')

  webinarIsComplete: (->
    @get('webinarComplete')
  ).property('webinarComplete')

  homeworkIsComplete: (->
    @get('homeworkComplete')
  ).property('homeworkComplete')

  quizIsActive: ->
    if @get('quizComplete')
      false
    else
      true

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

  homeworkIsAvailable: (->
    moment() < (@get('homeworkDeadline') + 7)
  ).property('homeworkDeadline', 'momentDate')






`export default UnitProgress;`

`import Ember from "ember";`

 # for more details see: http://emberjs.com/guides/components/

UnitTableStateComponent = Ember.Component.extend
  progress: null
  step: ''
  tagName: 'td'
  unit: ''
  examStates: ['case', 'webinar']
  classNameBindings: ['getClassName']


  getClassName: (->
    progress = @get 'progress'
    if @get('stepSupported')
      if (@get('progress').get("#{@get 'step'}IsComplete")) || (@get('stepIsWebinar') && @get('webinarWasVisited'))
        'positive'
      else
        if !@get('stepWithoutDeadline') && @get('stepIsTimeOut') then 'negative' else 'warning'
    else
      'active'
  ).property('progress',  'step')

  stepWithoutDeadline: (->
    @get('step') == 'video' || @get('step') == 'summary'
  ).property('step')

  stepIsWebinar: (->
    @get('step') == 'webinar'
  ).property('step')

  webinarIsStart: (->
    moment(@get('progress.webinar.start')) < moment() && moment(@get('progress.webinar.start')) > moment(@get('progress.webinarDeadline'))
  ).property('progress.webinar.start')

  webinarIsEnd: (->
    moment(@get('progress.webinarDeadline')) < moment()
  ).property('progress.webinarDeadline')

  webinarIsReview: (->
    @get('progress.webinarScore')?
  ).property('progress.webinarScore')

  webinarWasVisited: (->
    @get('progress.webinarScore') != 0 && @get('progress.webinarScore')?
  ).property('progress.webinarScore')

  stepIsTimeOut: (->
    moment(@get('progress').get("#{@get 'step'}Deadline")) < moment()
  ).property('progress', 'step')

  stepSupported: (->
    step = @get 'step'
    if step == 'case' || step =='webinar'
     true
    else
      !(@get('progress').get('isExam'))
  ).property('progress', 'step')

  stepIsCompleted: (->
    @get('progress').get("#{@get 'step'}IsComplete") || @get('homeworkIsReview')
  ).property('progress', 'progress.homeworkProgressState', 'step')

  homeworkIsReview: (->
    if @get('step') == 'homework'
      @get('progress').get("homeworkProgressState") == 'review'
  ).property('progress', 'progress.homeworkProgressState', 'step')

  stepFormattedDeadline: (->
    format = 'DD.MM'
    formattedDate = moment(@get('progress').get("#{@get 'step'}Deadline")).format(format)
  ).property('progress', 'step')

  webinarStart: (->
    format = 'DD.MM в HH:mm'
    if @get('progress.webinar.start')?
      moment(@get('progress.webinar.start')).format(format)
    else
      'Не задано'
  ).property('progress.webinar.start', 'step')


  openStep:( ->
    @sendAction('action', @get('unit.id'), @get('step'))

  ).on('click')




`export default UnitTableStateComponent;`

# for more details see: http://emberjs.com/guides/components/

Samolov.UnitTableStateComponent = Ember.Component.extend
  progress: null
  step: ''
  tagName: 'td'
  examStates: ['case', 'webinar']
  classNameBindings: ['getClassName']


  getClassName: (->
    progress = @get 'progress'
    if @get('stepSupported')
      if @get('stepIsCompleted') ||  @get('homeworkIsReview')
        'positive'
      else
        if @get('stepIsTimeOut') then 'negative' else 'warning'
    else
      'active'
  ).property('progress', 'progress.homeworkProgress.state', 'step')


  stepIsTimeOut: (->
    moment(@get('progress').get("#{@get 'step'}Deadline")) < moment()
  ).property('progress', 'step')

  stepSupported: (->
    !(@get('progress').get('isExam') && @get('examStates').indexOf(@get('step')) == -1)
  ).property('progress', 'step')

  stepIsCompleted: (->
    @get('progress').get("#{@get 'step'}IsComplete") || @get('homeworkIsReview')
  ).property('progress', 'progress.homeworkProgressState', 'step')

  homeworkIsReview: (->
    if @get('step') == 'homework'
      @get('progress').get("homeworkProgressState") == 'review'
  ).property('progress', 'progress.homeworkProgressState', 'step')

  stepFormattedDeadline: (->
    format = 'DD MMMM'
    formattedDate = moment(@get('progress').get("#{@get 'step'}Deadline")).format(format)
  ).property('progress', 'step')
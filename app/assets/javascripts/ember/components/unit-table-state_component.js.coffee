# for more details see: http://emberjs.com/guides/components/

Samolov.UnitTableStateComponent = Ember.Component.extend
  progress: null
  step: ''
  tagName: 'span'
  examStates: ['case', 'webinar']
  classNameBindings: ['getClassName']


  getClassName: (->
    progress = @get 'progress'
    if @get('stepSupported')
      if @get("#progress.{@get 'step'}Complete")
        'unit_steps positive'
      else
        if @get('stepIsTimeOut') then 'negative' else 'unit_steps warning'
    else
      'unit_steps active'
  ).property('progress',  'step')


  stepIsTimeOut: (->
    moment(@get('progress').get("#{@get 'step'}Deadline")) < moment()
  ).property('progress', 'step')

  stepSupported: (->
    step = @get 'step'
    if step == 'quiz' || step =='webinar'
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
    format = 'DD MMMM'
    formattedDate = moment(@get('progress').get("#{@get 'step'}Deadline")).format(format)
  ).property('progress', 'step')

  stepFormattedBeginning: (->
    format = 'DD MMMM'
    switch @get('step')
      when 'video' then moment(@get('progress.unitBeginning')).format(format)
      when 'quiz' then moment(@get('progress.videoDeadline')).format(format)
      when 'summary' then moment(@get('progress.quizDeadline')).format(format)
      when 'case' then moment(@get('progress.summaryDeadline')).format(format)
      when 'webinar'
        if @get('progress.webinar.start')?
          moment(@get('progress.webinar.start')).format(format)
        else
          'Не задано'
      when 'homework' then moment(@get('progress.webinarDeadline')).format(format)
      else 'Не задано'
  ).property('progress', 'step')

  actions:
    click: ->
#      @transitionToRoute(unit, unit.id, queryParams: {scope: @get 'step'})
      console.log('sdgjkjkn')

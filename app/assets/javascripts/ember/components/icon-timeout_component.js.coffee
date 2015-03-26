# for more details see: http://emberjs.com/guides/components/

Samolov.IconTimeoutComponent = Ember.Component.extend
  progress: null
  step: ''
  tagName: 'i'
  classNameBindings: ['getClassName']


  getClassName: (->
    if @get('stepIsTimeOut') && @get('stepIsNotCompleted')
      'warning icon'
    else
      ''
  ).property('progress.state', 'progress.homeworkProgress.state', 'step')

  stepIsTimeOut: (->
    moment(@get('progress').get("#{@get('step')}Deadline")) < moment()
  ).property('progress.state', 'progress.homeworkProgress.state',  'step')

  stepIsNotCompleted: (->
    if @get('step') == 'homework'
      @get('progress').get("homeworkProgress.state") == 'in_progress'
    else
      !@get('progress').get("#{@get 'step'}IsComplete")
  ).property('progress.state', 'progress.homeworkProgress.state', 'step')
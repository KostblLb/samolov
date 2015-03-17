# for more details see: http://emberjs.com/guides/components/

Samolov.UnitTableStateComponent = Ember.Component.extend
  progress: null
  step: ''
  tagName: 'td'
  examSatets: ['case', 'webinar']
  classNameBindings: ['getClassName']


  getClassName: (->
    progress = @get 'progress'
    return 'warning' unless @get('stepSupported')
    if @get('stepIsCompleted') then 'positive' else 'negative'
  ).property('progress', 'step')


  stepSupported: (->
    !(@get('progress').get('isExam') && @get('examSatets').indexOf(@get('step')) == -1)
  ).property('progress', 'step')

  stepIsCompleted: (->
    @get('progress').get("#{@get 'step'}IsComplete")
  ).property('progress', 'step')
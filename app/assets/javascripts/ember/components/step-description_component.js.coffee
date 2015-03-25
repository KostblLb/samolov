# for more details see: http://emberjs.com/guides/components/

Samolov.StepDescriptionComponent = Ember.Component.extend
  progress: null
  step: ''
  tagName: 'div'
  classNames: ['description']

  stepIsTimeOut: (->
    moment(@get('progress').get("#{@get('step')}Deadline")) < moment()
  ).property('progress', 'step')

  stepIsNotCompleted: (->
    !@get('progress').get("#{@get 'step'}IsComplete")
  ).property('progress', 'step')

  stepDeadline: (->
    currentStep = @get('step')[0].toUpperCase() + @get('step').substring(1,@get('step').length);
    @get('progress').get("formatted#{currentStep}Deadline")
  ).property('progress', 'step')

  didInsertElement: ->
    @_super()
    if @get('stepIsTimeOut') && @get('stepIsNotCompleted')
      i = $('<i></i>').insertBefore(@$().parent())
      i.addClass('icon')
      i.addClass('warning')
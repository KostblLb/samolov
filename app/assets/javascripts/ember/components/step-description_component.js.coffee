# for more details see: http://emberjs.com/guides/components/

Samolov.StepDescriptionComponent = Ember.Component.extend
  progress: null
  step: ''
  tagName: 'div'
  classNames: ['content']

  stepIsTimeOut: (->
    moment(@get('progress').get("#{@get('step')}Deadline")) < moment()
  ).property('progress.state', 'step')

  stepIsNotCompleted: (->
    if @get('step') == 'homework'
      @get('progress').get("homeworkProgress.state") == 'in_progress'
    else
      !@get('progress').get("#{@get 'step'}IsComplete")
  ).property('progress', 'step')

  stepDeadline: (->
    currentStep = @get('step')[0].toUpperCase() + @get('step').substring(1,@get('step').length);
    @get('progress').get("formatted#{currentStep}Deadline")
  ).property('progress.state', 'step')


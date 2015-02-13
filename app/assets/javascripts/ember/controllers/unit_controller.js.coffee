# for more details see: http://emberjs.com/guides/controllers/

Samolov.UnitController = Ember.ObjectController.extend
  queryParams: ['scope']
  scope: 'video'

  states:['video', 'quiz', 'summary', 'case', 'webinar', 'homework']
  actions:
    nextStep: ->
      progress = @model.get('myProgress')
      currentStateName = progress.get('state')
      nextState = @states.indexOf(currentStateName) + 1
      progress.set 'state', @states[nextState]
      progress.save().then =>
        if @states[nextState]=='quiz'
          @transitionToRoute('quiz', @model.get('quiz.id'))
        else
          if @states[nextState]=='case'
            @transitionToRoute('quiz', @model.get('case.id'))
          else
            @transitionToRoute('unit', @model.get('id'),{queryParams: {scope: @states[nextState]}})
Samolov.QuizProgressController = Ember.ObjectController.extend

  states:['video', 'quiz', 'summary', 'case', 'webinar', 'homework']
  actions:
    nextStep: ->
      quiz = @store.find('quiz', @model.get('quiz.id'))
      unit = @store.find('unit', { quiz: quiz })
      progress = unit.get('myProgress')
      currentStateName = progress.get('state')
      nextState = @states.indexOf(currentStateName) + 1
      progress.set 'state', @states[nextState]
      progress.save().then =>
        @transitionToRoute('unit', unit.get('id'),{queryParams: {scope: @states[nextState]}})
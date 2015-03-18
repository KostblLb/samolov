# for more details see: http://emberjs.com/guides/controllers/

Samolov.UnitController = Ember.ObjectController.extend
  states:['video', 'quiz', 'summary', 'case', 'webinar', 'homework']

  actions:
    nextStep: ->
      progress = @model.get('myProgress')
      progress.set 'stateEvent', 'next_step'
      progress.save().then (newProgress)=>
        newProgress.set 'stateEvent', null
        @transitionToRoute('unit.index', @model.id, {queryParams: {scope: newProgress.get('state')}})
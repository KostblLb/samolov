# for more details see: http://emberjs.com/guides/controllers/

Samolov.UnitController = Ember.ObjectController.extend
#  states:['video', 'quiz', 'summary', 'case', 'webinar', 'homework']



  sortedProgresses: (->
    @get('unitProgresses').sortBy('points').reverse()
  ).property('unitProgresses.@each.points')
  actions:
#    nextStep: ->
#      progress = @model.get('myProgress')
#      progress.set 'stateEvent', 'next_step'
#      progress.save().then (newProgress)=>
#        newProgress.set 'stateEvent', null
#        @transitionToRoute('unit.index', @model.id, {queryParams: {scope: newProgress.get('state')}})
    completePart: (partName)->
      progress = @model.get('myProgress')
      switch(partName)
        when 'video'
          progress.set 'videoComplete', true
        when 'summary'
          progress.set 'summaryComplete', true
        else
          alert "Извините, что-то пошло не так"
      progress.save().then =>
        location.reload

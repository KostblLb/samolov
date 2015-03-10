Samolov.HomeworkProgressIndexController = Ember.ObjectController.extend


  actions:
    sendHomework:->
      @model.set(isComplete, true)
      @model.set(status, 'review')
      @model.save()
    saveHomework:->
      @model.save()




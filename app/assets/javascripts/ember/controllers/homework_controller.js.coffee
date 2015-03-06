Samolov.HomeworkProgressController = Ember.ObjectController.extend


  actions:
    sendHomework:->
      @set(@model.isComplete, true)
      @model.save()
    saveHomework:->
      @set(@model.state, 'review')
      @model.save()




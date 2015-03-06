Samolov.HomeworkProgressController = Ember.ObjectController.extend


  actions:
    sendHomework:->
      @set(@model.isComplete, true)
      @model.save()
    saveHomework:->
      @model.save()




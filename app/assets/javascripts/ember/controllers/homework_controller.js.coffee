Samolov.HomeworkProgressController = Ember.ObjectController.extend


  actions:
    sendHomework:->
      @model.save()




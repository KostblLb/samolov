Samolov.HomeworkProgressIndexController = Ember.ObjectController.extend


  actions:
    sendHomework:->
      progress = @model
      progress.set 'status', 'review'
      progress.save()

    saveHomework:->
      @model.save()




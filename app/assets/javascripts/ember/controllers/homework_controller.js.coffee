Samolov.HomeworkProgressIndexController = Ember.ObjectController.extend


  actions:
    sendHomework:->
      progress = @model
      progress.set 'state', 'review'
      progress.save()

    saveHomework:->
      @model.save()




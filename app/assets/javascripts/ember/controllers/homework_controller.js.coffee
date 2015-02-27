Samolov.HomeworkProgressController = Ember.ObjectController.extend


  actions:
    sendHmework:->
      homework = @model
      homework.tasks.set([])
      homework.save()
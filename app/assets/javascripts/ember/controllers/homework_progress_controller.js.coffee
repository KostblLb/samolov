Samolov.HomeworkProgressController = Ember.ObjectController.extend


  actions:
    sendHomework:->
      progress = @model
      progress.set 'state', 'review'
      progress.save().then ->
        window.scrollTo 0, 0

    saveHomework:->
      progress = @model
      progress.save().then ->
      progress.set 'isSaved', true
      window.scrollTo 0, 0




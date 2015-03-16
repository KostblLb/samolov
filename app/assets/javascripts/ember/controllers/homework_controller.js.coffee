Samolov.HomeworkProgressIndexController = Ember.ObjectController.extend


  actions:
    sendHomework:->
      progress = @model
      progress.set 'state', 'review'
      progress.save().then ->
        @transitionToRoute('homework_progress', progress.id)

    saveHomework:->
      progress = @model
      progress.save().then ->
      progress.set 'isSaved', true
      window.scrollTo 0, 0




# for more details see: http://emberjs.com/guides/controllers/

Samolov.HomeworkReviewController = Ember.ObjectController.extend
  actions:
    endChecking:->
      progress = @model
      progress.set 'state', 'verified'
      progress.save()
    saveHomework: ->
      @model.save()


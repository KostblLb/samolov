# for more details see: http://emberjs.com/guides/controllers/

Samolov.HomeworkReviewController = Ember.ObjectController.extend
  actions:
    endChecking:->
      progress = @model
      progress.set 'state', 'verified'
      progress.save() ->
        transitionTo()
    saveHomework: ->
      progress = @model
      progress.save().then ->
      progress.set 'isReviewSaved', true
      window.scrollTo 0, 0


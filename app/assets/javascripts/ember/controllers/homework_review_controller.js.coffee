# for more details see: http://emberjs.com/guides/controllers/

Samolov.HomeworkReviewController = Ember.ObjectController.extend
  actions:
    endChecking:->
      progress = @model
      progress.set 'stateEvent', 'verify'
      progress.save().then (newProgress)=>
        newProgress.set 'stateEvent', null
      window.scrollTo 0, 0

    saveHomework: ->
      progress = @model
      progress.save().then ->
      progress.set 'isReviewSaved', true
      window.scrollTo 0, 0


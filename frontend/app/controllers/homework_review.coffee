`import Ember from "ember";`

  # for more details see: http://emberjs.com/guides/controllers/

HomeworkReviewController = Ember.ObjectController.extend
  actions:
    endChecking:->
      progress = @model
      progress.set 'stateEvent', 'verify'
      progress.save().then (newProgress)=>
        progress.reload()
        newProgress.set 'stateEvent', null
        window.scrollTo 0, 0

    saveHomework: ->
      progress = @model
      progress.save().then ->
      progress.set 'isReviewSaved', true
      window.scrollTo 0, 0

    sendToStudent: ->
      progress = @model
      progress.set 'stateEvent', 'return'
      progress.save().then (newProgress)=>
        progress.reload()
        newProgress.set 'stateEvent', null
        history.back()


 `export default HomeworkReviewController;`

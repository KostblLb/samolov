`import Ember from "ember";`

HomeworkProgressController = Ember.ObjectController.extend
  actions:
    sendHomework:->
      progress = @model
      progress.set 'stateEvent', 'complete'
      progress.set 'homeworkComplete', true
      progress.save().then (newProgress)=>
        progress.reload()
        newProgress.set 'stateEvent', null
        window.scrollTo 0, 0

    saveHomework:->
      progress = @model
      progress.save().then ->
      progress.set 'isSaved', true
      window.scrollTo 0, 0


 `export default HomeworkProgressController;`

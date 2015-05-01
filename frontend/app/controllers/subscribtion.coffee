`import Ember from "ember";`

SubscribtionController = Ember.ObjectController.extend
  actions:
    save: ->
      @model.save()

`export default SubscribtionController;`

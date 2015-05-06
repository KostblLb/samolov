Samolov.SubscribtionController = Ember.ObjectController.extend

  actions:
    save: ->
      @model.save()

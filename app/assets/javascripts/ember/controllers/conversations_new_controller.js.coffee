# for more details see: http://emberjs.com/guides/controllers/

Samolov.ConversationsNewController = Ember.ObjectController.extend

  actions:
    create: ->
      @model.save().then =>
        @transitionToRoute('conversations')
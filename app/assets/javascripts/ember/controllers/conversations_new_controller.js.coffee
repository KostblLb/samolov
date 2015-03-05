# for more details see: http://emberjs.com/guides/controllers/

Samolov.ConversationsNewController = Ember.ObjectController.extend

  actions:
    create: ->
      @model.save().then =>
        @model.get('messages.lastObject').deleteRecord() if @model.get('messages.lastObject.isNew')
        @transitionToRoute('conversations')
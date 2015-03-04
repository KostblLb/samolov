# for more details see: http://emberjs.com/guides/controllers/

Samolov.ConversationIndexController = Ember.ObjectController.extend

  actions:
    addMessage: ->
      @model.get('messages.lastObject').save()
      message = @store.createRecord 'message'
      @model.get('messages').pushObject message
    removeMessage: (message) ->
      message.destroyRecord()

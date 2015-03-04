# For more information see: http://emberjs.com/guides/routing/

Samolov.ConversationRoute = Ember.Route.extend
  afterModel: (conversation)->
    message = @store.createRecord 'message'
    conversation.get('messages').pushObject message
    conversation

  model: (params) ->
    conversation = @store.find 'conversation', params.id

  actions:
    willTransition: (transition)->
      @currentModel.get('messages.lastObject').deleteRecord() if @currentModel.get('messages.lastObject.isNew')
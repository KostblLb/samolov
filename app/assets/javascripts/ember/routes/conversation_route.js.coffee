# For more information see: http://emberjs.com/guides/routing/

Samolov.ConversationRoute = Ember.Route.extend
  afterModel: (conversation)->
    conversation.reload().then =>
      message = @store.createRecord 'message'
      conversation.get('messages').pushObject message
      $.ajax('/api/v1/conversations/' + conversation.get('id') + '/view.json', 'GET')
      conversation

  model: (params) ->
    conversation = @store.find('conversation', params.id)

  actions:
    willTransition: (transition)->
      @currentModel.get('messages.lastObject').deleteRecord() if @currentModel.get('messages.lastObject.isNew')
# For more information see: http://emberjs.com/guides/routing/

Samolov.ConversationsNewRoute = Ember.Route.extend
  queryParams:
    sender_id:
      refreshModel: true


  model: (params) ->
    conversation = @store.createRecord 'conversation'
    message = @store.createRecord 'message'
    conversation.get('messages').pushObject message
    if params.sender_id?
      @store.find('user', params.sender_id).then (sender) =>
        conversation.get('users').pushObject sender
    conversation

  setupController: (controller, model) ->
    controller.set('model', model)
    controller.set('availableUsers', @currentUser.get('friends'))


  actions:
    willTransition: (transition)->
      @currentModel.deleteRecord() if @currentModel.get('isNew')

# For more information see: http://emberjs.com/guides/routing/

Samolov.ConversationsNewRoute = Ember.Route.extend
  beforeModel: ->
    @store.find 'user'

  model: ->
    conversation = @store.createRecord 'conversation'
    message = @store.createRecord 'message'
    conversation.get('messages').pushObject message
    conversation

  setupController: (controller, model) ->
    controller.set('model', model)
    controller.set('availableUsers', @store.all('user'))


  actions:
    willTransition: (transition)->
      @currentModel.deleteRecord()

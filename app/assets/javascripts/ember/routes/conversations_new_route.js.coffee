# For more information see: http://emberjs.com/guides/routing/

Samolov.ConversationsNewRoute = Ember.Route.extend
  model: ->
    @store.createRecord 'conversation'

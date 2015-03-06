
Samolov.ConversationsIndexRoute = Ember.Route.extend
  model: ->
    @store.find 'conversation'
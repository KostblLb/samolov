# For more information see: http://emberjs.com/guides/routing/

Samolov.UsersEditRoute = Ember.Route.extend
  model: ->
    @store.find 'user', window.myId
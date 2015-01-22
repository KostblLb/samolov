# For more information see: http://emberjs.com/guides/routing/

Samolov.UsersIndexRoute = Ember.Route.extend
  model: ->
    @store.find 'user'
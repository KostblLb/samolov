# For more information see: http://emberjs.com/guides/routing/

Samolov.UsersShowRoute = Ember.Route.extend
  model: (params)->
    @store.find 'user', params.id
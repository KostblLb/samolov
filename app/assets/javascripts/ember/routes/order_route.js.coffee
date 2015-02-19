# For more information see: http://emberjs.com/guides/routing/

Samolov.OrderRoute = Ember.Route.extend
  model: (params) ->
    @store.find 'order', params.id
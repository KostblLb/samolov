# For more information see: http://emberjs.com/guides/routing/

Samolov.ScaleRoute = Ember.Route.extend
  model: (params)->
    @store.find 'scale', params.id
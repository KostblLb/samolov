# For more information see: http://emberjs.com/guides/routing/

Samolov.ScalesIndexRoute = Ember.Route.extend
  model: ->
    @store.find 'scale'

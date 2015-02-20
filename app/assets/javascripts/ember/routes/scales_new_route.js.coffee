# For more information see: http://emberjs.com/guides/routing/

Samolov.ScalesNewRoute = Ember.Route.extend
  model: ->
    @store.createRecord 'scale'
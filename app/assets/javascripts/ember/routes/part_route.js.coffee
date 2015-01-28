# For more information see: http://emberjs.com/guides/routing/

Samolov.PartRoute = Ember.Route.extend
  model: (params) ->
    @store.find 'part', params.part_id
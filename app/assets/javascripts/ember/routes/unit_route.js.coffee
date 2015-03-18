# For more information see: http://emberjs.com/guides/routing/

Samolov.UnitRoute = Ember.Route.extend

  model: (params)->
    @store.find('unit', params.unit_id)



# For more information see: http://emberjs.com/guides/routing/

Samolov.GroupsShowRoute = Ember.Route.extend
  model: (params) ->
    @store.find 'group', params.id
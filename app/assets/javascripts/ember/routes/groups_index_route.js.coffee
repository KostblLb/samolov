# For more information see: http://emberjs.com/guides/routing/

Samolov.GroupsIndexRoute = Ember.Route.extend
  model: ->
    @store.find('group', scope: 'as_teacher')
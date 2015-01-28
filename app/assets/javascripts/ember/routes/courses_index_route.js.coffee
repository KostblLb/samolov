# For more information see: http://emberjs.com/guides/routing/

Samolov.CoursesIndexRoute = Ember.Route.extend
  model: ->
    @store.find 'course'
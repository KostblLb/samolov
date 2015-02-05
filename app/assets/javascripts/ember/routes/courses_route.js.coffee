# For more information see: http://emberjs.com/guides/routing/

Samolov.CoursesRoute = Ember.Route.extend
  model: ->
    @store.find 'course'
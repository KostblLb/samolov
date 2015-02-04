# For more information see: http://emberjs.com/guides/routing/

Samolov.CoursesShowRoute = Ember.Route.extend
  model: (params)->
    @store.find 'course', params.id

  renderTemplate: ->
    @render()
    @render 'groups/show_in_sidebar',  outlet: 'right_sidebar'

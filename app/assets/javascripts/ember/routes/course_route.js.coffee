# For more information see: http://emberjs.com/guides/routing/

Samolov.CourseRoute = Ember.Route.extend
  model: (params)->
    @store.find 'course', params.id

  renderTemplate: ->
    @render()
    @render 'groups/show_in_sidebar',  outlet: 'right_sidebar'
    @render 'course_progress/pivot',   outlet: 'pivot'





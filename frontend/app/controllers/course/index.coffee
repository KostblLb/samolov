`import Ember from "ember"`

CourseIndexController = Ember.ObjectController.extend
  actions:
    openStep: (unit, step)->
      @transitionToRoute('unit', unit, {queryParams: {scope: step}})

    showUnitBeginning: ->
      $('.basic.modal').modal('show')

`export default CourseIndexController`

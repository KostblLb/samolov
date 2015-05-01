`import Ember from "ember";`

  # for more details see: http://emberjs.com/guides/controllers/

CourseBuyController = Ember.ObjectController.extend
  actions:
    create: ->
      @model.save().then (order) =>
        @transitionToRoute 'order', order.id

`export default CourseBuyController;`

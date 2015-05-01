`import Ember from "ember";`

  # for more details see: http://emberjs.com/guides/controllers/

AdvertsNewController = Ember.ObjectController.extend
  actions:
    create: ->
      @model.save().then =>
        @transitionToRoute 'groups'


`export default AdvertsNewController;`

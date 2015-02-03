# for more details see: http://emberjs.com/guides/controllers/

Samolov.AdvertsNewController = Ember.ObjectController.extend
  actions:
    create: ->
      @model.save().then =>
        @transitionToRoute 'groups'

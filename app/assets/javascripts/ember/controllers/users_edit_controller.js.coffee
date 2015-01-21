# for more details see: http://emberjs.com/guides/controllers/

Samolov.UsersEditController = Ember.ObjectController.extend
  actions:
    save: ->
      @model.save().then =>
        @transitionToRoute 'users.show', @model

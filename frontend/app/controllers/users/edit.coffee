`import Ember from "ember"`

  # for more details see: http://emberjs.com/guides/controllers/

UsersEditController = Ember.ObjectController.extend
  actions:
    save: ->
      @model.save().then =>
        @model.reload().then =>
            @transitionToRoute 'users.show', @model


`export default UsersEditController`

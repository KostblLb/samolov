# for more details see: http://emberjs.com/guides/controllers/

Samolov.GroupsShowController = Ember.ObjectController.extend
  actions:
    update: ->
      @model.save()

    saveWebinarScore: (progress)->
      progress.save().then =>
        @model.reload()



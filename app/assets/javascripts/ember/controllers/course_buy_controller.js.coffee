# for more details see: http://emberjs.com/guides/controllers/

Samolov.CourseBuyController = Ember.ObjectController.extend
  actions:
    create: ->
      @model.save()
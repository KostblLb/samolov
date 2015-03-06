# for more details see: http://emberjs.com/guides/controllers/

Samolov.HomeworkProgressReviewController = Ember.ObjectController.extend
  actions:
    submit: ->
      @model.save()


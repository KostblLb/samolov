# For more information see: http://emberjs.com/guides/routing/

Samolov.QuestionRoute = Ember.Route.extend
  model: (params)->
    @store.find 'question', params.question_id

  setupController: (controller, model) ->
    controller.set 'model', model
    controller.set 'userAnswer', @store.createRecord('user_answer', question: model)
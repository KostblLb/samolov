# For more information see: http://emberjs.com/guides/routing/

Samolov.QuestionRoute = Ember.Route.extend
  model: (params)->
    @store.find('question', params.question_id).then (question) =>
      question.reload()

  setupController: (controller, model) ->
    controller.set 'model', model
    unless model.get('myAnswer')
      controller.set 'userAnswer', @store.createRecord('user_answer', question: model)

  afterModel: (question) ->
    if question.get('quiz.isQuiz')
      $('.case_tab').removeClass('active')
      $('.quiz_tab').addClass('active')
    else
      $('.quiz_tab').removeClass('active')
      $('.case_tab').addClass('active')

  actions:
    willTransition: ->
      $('.quiz_tab').removeClass('active')
      $('.case_tab').removeClass('active')
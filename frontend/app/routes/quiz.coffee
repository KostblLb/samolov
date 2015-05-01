`import Ember from "ember";` 
 
# For more information see: http://emberjs.com/guides/routing/

QuizRoute = Ember.Route.extend
  model: (params) ->
    @store.find 'quiz', params.quiz_id

  afterModel: (model) ->
    if model.get('isQuiz')
      $('.case_tab').removeClass('active')
      $('.quiz_tab').addClass('active')
    else
      $('.quiz_tab').removeClass('active')
      $('.case_tab').addClass('active')
    @transitionTo('quiz_progress', model.get('myProgress.id')) unless model.get('myProgress.currentQuestionId')?
 
`export default QuizRoute;`

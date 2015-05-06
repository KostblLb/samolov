`import Ember from "ember";` 
 
# For more information see: http://emberjs.com/guides/routing/

QuizReviewRoute = Ember.Route.extend
  model: (params) ->
    @store.find 'quiz_progress', params.quiz_progress_id
 
`export default QuizReviewRoute;`

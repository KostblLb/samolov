`import Ember from "ember";` 
 
# For more information see: http://emberjs.com/guides/routing/

HomeworkReviewRoute = Ember.Route.extend
  model: (params) ->
    @store.find 'homework_progress', params.homework_progress_id
 
`export default HomeworkReviewRoute;`

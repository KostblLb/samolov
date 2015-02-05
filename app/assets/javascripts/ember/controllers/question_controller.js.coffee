# for more details see: http://emberjs.com/guides/controllers/

Samolov.QuestionController = Ember.ObjectController.extend
  userAnswer: null

  actions:
    answer: ->
      # TODO: Implement true logic
      console.log "User select answer #{@get 'userAnswer'}"

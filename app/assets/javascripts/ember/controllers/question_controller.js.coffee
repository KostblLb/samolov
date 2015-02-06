# for more details see: http://emberjs.com/guides/controllers/

Samolov.QuestionController = Ember.ObjectController.extend
  userAnswer: null

  actions:
    answer: ->
      userAnswer = @store.createRecord 'user_answer', {
        answer: @get('userAnswer')
        question: @get('model')
      }
      userAnswer.save().then (userAnswer) =>
        @store.find('quiz_progress', userAnswer.get('quizProgressId')).then (progress) =>
          progress.reload().then =>
            @transitionToRoute('quiz_progress', userAnswer.get('quizProgressId'))


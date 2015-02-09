# for more details see: http://emberjs.com/guides/controllers/

Samolov.QuestionController = Ember.ObjectController.extend
  userAnswers: []

  canAnswer: ( ->
    @get('userAnswers').get('length') == @get('model').get('rightAnswersCount')
  ).property('userAnswers.length')

  actions:
    answer: ->
      userAnswer = @store.createRecord 'user_answer', {
        question: @get('model')
        answerIds: @get('userAnswers')
      }
      userAnswer.save().then (userAnswer) =>
        @store.find('quiz_progress', userAnswer.get('quizProgressId')).then (progress) =>
          progress.reload().then =>
            @set 'userAnswers', []
            @transitionToRoute('quiz_progress', userAnswer.get('quizProgressId'))


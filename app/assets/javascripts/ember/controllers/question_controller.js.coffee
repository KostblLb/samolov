# for more details see: http://emberjs.com/guides/controllers/

Samolov.QuestionController = Ember.ObjectController.extend

  canAnswer: ( ->
    @get('userAnswer.answers').get('length') == @get('model').get('rightAnswersCount')
  ).property('userAnswer.answers')

  actions:
    answer: ->
      @get('userAnswer').save().then (userAnswer) =>
        @store.find('quiz_progress', userAnswer.get('quizProgressId')).then (progress) =>
          progress.reload().then =>
            @set 'userAnswers', []
            @transitionToRoute('quiz_progress', userAnswer.get('quizProgressId'))


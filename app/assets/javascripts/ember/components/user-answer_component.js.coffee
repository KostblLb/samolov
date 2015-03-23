# for more details see: http://emberjs.com/guides/components/

Samolov.UserAnswerComponent = Ember.Component.extend
  tagName: 'table'
  classNames: ['ui', 'table']

  userAnswer: (->
    id = @get('id')
    answers = @get('userAnswers')
    answers.findBy('questionId', id)
  ).property('id', 'userAnswers')



`import Ember from "ember";`

 # for more details see: http://emberjs.com/guides/components/

UserAnswerComponent = Ember.Component.extend
  tagName: 'div'
  classNames: ['ui', 'list']

  userAnswer: (->
    id = @get('id')
    answers = @get('userAnswers')
    answers.findBy('questionId', id).get('answers')
  ).property('id', 'userAnswers')




`export default UserAnswerComponent;`

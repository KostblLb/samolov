Samolov.QuizProgressController = Ember.ObjectController.extend Samolov.UnitNextStepMixin,
  needs: ['unit']
  unit: Ember.computed.alias('controllers.unit.model')
  canNext: (->
    state = @get('unit.myProgress.state')
    if @model.get('isQuiz')
      return state == 'quiz'
    else
      return state == 'case'
  ).property('model')


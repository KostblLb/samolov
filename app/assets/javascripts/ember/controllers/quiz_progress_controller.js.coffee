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

  isNotAvailable: (->
    state = @get('unit.myProgress.state')
    if state == 'video'
      true
    else
      if @model.get('isQuiz')
        return state == 'video'
      else
        if @model.get('isCase')
          return state == 'video' || state == 'quiz' || state == 'summary'
        else
          false

  ).property('model')

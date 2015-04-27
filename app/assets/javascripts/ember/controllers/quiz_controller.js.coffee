Samolov.QuizController = Ember.ObjectController.extend Samolov.UnitNextStepMixin,
  needs: ['unit']
  unit: Ember.computed.alias('controllers.unit.model')

#  isNotAvailable: (->
#    state = @get('unit.myProgress.state')
#    if state == 'video'
#      true
#    else
#      if @model.get('isQuiz')
#        return state == 'video'
#      else
#        if @model.get('isCase')
#          return state == 'video' || state == 'quiz' || state == 'summary'
#        else
#          false
#  ).property('model')

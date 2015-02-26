Samolov.QuizProgressController = Ember.ObjectController.extend
  needs: ['unit']
  unit: Ember.computed.alias('controllers.unit.model')
  canNext: (->
    state = @get('unit.myProgress.state')
    if @model.get('isQuiz')
      return state == 'quiz'
    else
      return state == 'case'
  ).property()

#
#  actions:
#    backToUnit:->
#      if @model.get('isQuiz')
#        @transitionToRoute('unit', @model.get('unitId'),{queryParams: {scope: 'summary'}})
#      else
#        @transitionToRoute('unit', @model.get('unitId'),{queryParams: {scope: 'webinar'}})
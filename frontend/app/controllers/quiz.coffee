`import Ember from "ember";`
`import UnitNextStepMixin from "../mixins/unit_next_step_mixin"`

QuizController = Ember.ObjectController.extend UnitNextStepMixin,
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

`export default QuizController;`

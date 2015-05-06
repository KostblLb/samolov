`import Ember from "ember";`
`import UnitNextStepMixin from "../mixins/unit_next_step_mixin"`

QuizProgressController = Ember.ObjectController.extend UnitNextStepMixin,
  needs: ['unit']
  unit: Ember.computed.alias('controllers.unit.model')
#  canNext: (->
#    state = @get('unit.myProgress.state')
#    if @model.get('isQuiz')
#      return state == 'quiz'
#    else
#      return state == 'case'
#  ).property('model')


 `export default QuizProgressController;`

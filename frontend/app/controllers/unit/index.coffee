`import Ember from "ember"`
`import UnitNextStepMixin from "../../mixins/unit_next_step_mixin"`

UnitIndexController = Ember.ObjectController.extend UnitNextStepMixin,
  queryParams: 'scope'
  scope: null
  tpl: (->
    "unit/#{@get 'scope'}"
  ).property('scope')

  canNext: (->
    @model.get('myProgress.state') == @get('scope')
  ).property('scope')


`export default UnitIndexController`

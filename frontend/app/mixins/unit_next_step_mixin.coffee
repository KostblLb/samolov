`import Ember from "ember";` 
 
UnitNextStepMixin = Ember.Mixin.create
  actions:
    completePart: (partName)->
      @controllerFor('unit').send 'completePart', partName
 
`export default UnitNextStepMixin;`

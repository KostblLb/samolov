Samolov.UnitNextStepMixin = Ember.Mixin.create
  actions:
    completePart: (partName)->
      @controllerFor('unit').send 'completePart', partName
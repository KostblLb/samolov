Samolov.UnitNextStepMixin = Ember.Mixin.create
  actions:
    nextStep: ->
      @controllerFor('unit').send 'nextStep'
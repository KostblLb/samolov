# for more details see: http://emberjs.com/guides/controllers/

Samolov.UnitIndexController = Ember.ObjectController.extend Samolov.UnitNextStepMixin,
  queryParams: ['scope']
  scope: 'video'
  tpl: (->
    "unit/#{@get 'scope'}"
  ).property('scope')

  canNext: (->
    @model.get('myProgress.state') == @get('scope')
  ).property('scope')

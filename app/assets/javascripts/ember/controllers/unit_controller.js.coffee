# for more details see: http://emberjs.com/guides/controllers/

Samolov.UnitController = Ember.ObjectController.extend
  queryParams: ['scope']
  scope: 'video'

  actions:
    nextStep: ->
      nextState = @get('myProgress.state')+1
      @store.find('unitProgress', @get('myProgress.id')).then =>
          @unitProgress.set 'state', nextState
          @unitProgress.save()



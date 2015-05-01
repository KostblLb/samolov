`import Ember from "ember";` 
 
# For more information see: http://emberjs.com/guides/routing/

AdvertsNewRoute = Ember.Route.extend
  model: ()->
    group = @modelFor 'groups.show'
    @store.createRecord 'advert', groupId: group.id

  renderTemplate: ->
    @render()
    @render into: 'application'
 
`export default AdvertsNewRoute;`

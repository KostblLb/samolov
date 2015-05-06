`import Ember from "ember";` 
 
# For more information see: http://emberjs.com/guides/routing/

UnitRoute = Ember.Route.extend

  model: (params)->
    @store.find('unit', params.unit_id)



 
`export default UnitRoute;`

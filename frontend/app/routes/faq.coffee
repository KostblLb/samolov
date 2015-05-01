`import Ember from "ember";`

# For more information see: http://emberjs.com/guides/routing/

FaqRoute = Ember.Route.extend
  model: ->
    @store.find('faq')

`export default FaqRoute;`

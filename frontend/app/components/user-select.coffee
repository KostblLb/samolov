`import Ember from "ember";` 
 
 # for more details see: http://emberjs.com/guides/components/

UserSelectComponent = Ember.Component.extend
  didInsertElement: ->
    @$(".js-example-basic-multiple").select2() 
 
`export default UserSelectComponent;`

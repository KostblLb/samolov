`import Ember from "ember";` 
 
 # for more details see: http://emberjs.com/guides/components/

ArrayItemComponent = Ember.Component.extend
 item: (->
   array = @get('array')
   array[@get('index')] if array?
  ).property('array', 'index')

 
 
`export default ArrayItemComponent;`

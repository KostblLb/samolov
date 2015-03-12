# for more details see: http://emberjs.com/guides/components/

Samolov.ArrayItemComponent = Ember.Component.extend
 item: (->
   array = @get('array')
   array[@get('index')] if array?
  ).property('array', 'index')


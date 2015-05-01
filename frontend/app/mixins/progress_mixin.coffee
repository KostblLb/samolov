`import Ember from "ember";` 
 
ProgressMixin = Ember.Mixin.create

  maxPoints: DS.attr 'number'
  points:    DS.attr 'number'

  user: DS.belongsTo 'user', async: true

  success: (->
    "#{@get 'points'}/#{@get 'maxPoints'}"
  ).property('points', 'maxPoints')

  color: (->
    step = @get('maxPoints') / 3
    switch
      when @get('points') < step                                then 'red'
      when @get('points') < (2 * step) && @get('points') > step then 'yellow'
      when @get('points') > step                                then 'green'
  ).property('points', 'maxPoints')

  rowColor: (->
    step = @get('maxPoints') / 3
    switch
      when @get('points') < step                                then 'negative'
      when @get('points') < (2 * step) && @get('points') > step then 'warning'
      when @get('points') > step                                then 'positive'
  ).property('points', 'maxPoints')
 
`export default ProgressMixin;`

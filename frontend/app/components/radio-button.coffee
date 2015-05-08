`import Ember from "ember";`

 # for more details see: http://emberjs.com/guides/components/

RadioButtonComponent = Ember.Component.extend
  classNames: ['ui', 'checkbox']

  didInsertElement: ->
    @_super()
    @$().checkbox()

  click : ->
    needAdd = @get("selection").indexOf(@get("value")) == -1
    @get('selection').clear() if @get('single')
    if needAdd
      @get('selection').pushObject @get('value')
    else
      @get('selection').removeObject @get('value')
  checked: (->
    return @get("selection").indexOf(@get("value")) != -1
  ).property('selection')


`export default RadioButtonComponent;`

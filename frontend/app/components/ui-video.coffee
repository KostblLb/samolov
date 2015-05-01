`import Ember from "ember";` 
 
 # for more details see: http://emberjs.com/guides/components/

UiVideoComponent = Ember.Component.extend
  classNames: ['ui', 'video']
  didInsertElement: () ->
    @$().attr 'data-url', @data_url
    @$().video()

 
 
`export default UiVideoComponent;`

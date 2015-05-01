`import Ember from "ember";` 
 
 # for more details see: http://emberjs.com/guides/components/

ProgressBarComponent = Ember.Component.extend
  percent: 100
  classNames: ['ui', 'green', 'progress' ]
  didInsertElement: () ->
    @$().progress(percent: @percent)


 
 
`export default ProgressBarComponent;`

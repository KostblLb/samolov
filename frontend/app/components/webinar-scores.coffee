`import Ember from "ember"`

WebinarScoresComponent = Ember.Component.extend
  classNames: ['ui', 'input']
  progress: null

  focusOut: ->
    @get('progress').save()

`export default WebinarScoresComponent`

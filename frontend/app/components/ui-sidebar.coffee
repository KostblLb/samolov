`import Ember from 'ember'`

UiSidebarComponent = Ember.Component.extend
  buttonLabel: ''
  position: 'right'

  visible: false

  _init: (->
    @$('.ui.sidebar').sidebar('setting', 'transition', 'overlay')
                     .sidebar('setting', 'dimPage', false)
                     .sidebar('setting', 'closable', false)
                     .sidebar('attach events', '.sidebar-toggler')
    if @get 'visible'
      @$('.ui.sidebar').sidebar 'toggle'
  ).on('didInsertElement')

  buttonClass: (->
    "stick-#{@get 'position'}"
  ).property('position')

`export default UiSidebarComponent`

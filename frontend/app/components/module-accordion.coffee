`import Ember from "ember";` 
 
 # for more details see: http://emberjs.com/guides/components/

ModuleAccordionComponent = Ember.Component.extend

  changeIcon: ->
    if @$('.moduleContent').css('display') == 'none'
      @$('.toggleIcon').removeClass('right')
      @$('.toggleIcon').addClass('down')
    else
      @$('.toggleIcon').removeClass('down')
      @$('.toggleIcon').addClass('right')

  didInsertElement: ->
    @_super()
    @$('.moduleContent').hide()
    @$().css('margin-top','15px')
    @$().css('cursor','pointer')

  actions:
    toggleModule: ->
      @changeIcon()
      @$('.moduleContent').toggle(700)

 
 
`export default ModuleAccordionComponent;`

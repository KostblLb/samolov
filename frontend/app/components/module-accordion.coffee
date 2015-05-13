`import Ember from "ember";`

 # for more details see: http://emberjs.com/guides/components/

ModuleAccordionComponent = Ember.Component.extend
  part: null

  changeIcon: ->
    if @$('.moduleContent').css('display') == 'none'
      @$('.toggleIcon').removeClass('right')
      @$('.toggleIcon').addClass('down')
    else
      @$('.toggleIcon').removeClass('down')
      @$('.toggleIcon').addClass('right')

  didInsertElement: ->
    @_super()
    if !@get('part.isCurrent')
      @$('.moduleContent').hide()
    @$().css('margin-top','15px')
    @$().css('cursor','pointer')

  actions:
    toggleModule: ->
      @changeIcon()
      @$('.moduleContent').toggle(700)

  thisIsPart: (->
    @get('part')?
  ).property('part')



`export default ModuleAccordionComponent;`

# for more details see: http://emberjs.com/guides/components/

Samolov.ModuleAccordionComponent = Ember.Component.extend

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


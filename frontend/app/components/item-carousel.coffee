`import Ember from 'ember'`

ItemCarouselComponent = Ember.Component.extend

  didInsertElement: ->
    @$('#carousel').slick
      slidesToShow: 1
      slidesToScroll: 1
      adaptiveHeight: true
    $('.carousel_right img').click ->
      @$('#carousel').slick('slickNext')
    $('.carousel_left img').click ->
      @$('#carousel').slick('slickPrev')

`export default ItemCarouselComponent`

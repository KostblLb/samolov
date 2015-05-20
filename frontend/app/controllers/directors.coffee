`import Ember from 'ember'`

DirectorsController = Ember.ObjectController.extend

  actions:
    create: ->
      @model.save().then =>
        $('button.join_button').text('Отправлено')
        $('#recall').text('')
        $('#recall').append('<i class="checkmark icon"></i>Отправлено')
        setTimeout (->
          unless $('#join_form').css('display') == 'none'
            $('#join_form').toggle(400);
          $('button.join_button').text('Записаться')
          $('#recall').text('')
          $('#recall').append('<i class="text telephone icon"></i>Перезвонить')
          return
        ), 2000
        @set('model', @store.createRecord 'inquire')

`export default DirectorsController`

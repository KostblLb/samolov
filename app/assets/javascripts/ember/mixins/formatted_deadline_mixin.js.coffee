Samolov.FormattedDeadlineMixin = Ember.Mixin.create(
  format: 'DD.MM.YYYY'

  formattedDeadline: (->
    date = @.get 'deadline'
    format = @.get 'format'
    moment(date).format format
  ).property('deadline', 'format')
)
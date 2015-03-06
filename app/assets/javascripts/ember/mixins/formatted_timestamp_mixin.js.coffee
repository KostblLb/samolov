Samolov.FormattedTimestampMixin = Ember.Mixin.create(
  format: 'DD/MM/YYYY HH:mm:ss'

  formattedUpdatedAt: (->
    date = @.get 'updated_at'
    format = @.get 'format'
    moment(date).format format
  ).property('updated_at', 'format')

  formattedCreatedAt: (->
    date = @.get 'created_at'
    format = @.get 'format'
    moment(date).format format
  ).property('created_at', 'format')

)
Samolov.Conversation = DS.Model.extend Samolov.FormattedTimestampMixin, Ember.Validations.Mixin,
  subject: DS.attr 'string'
  created_at: DS.attr 'string'
  updated_at: DS.attr 'string'
  hasUnread: DS.attr 'boolean'

  users: DS.hasMany 'user'
  messages: DS.hasMany 'message'

  validations:
    users:
      presence: true
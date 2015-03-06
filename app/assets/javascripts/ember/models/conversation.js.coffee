Samolov.Conversation = DS.Model.extend Samolov.FormattedTimestampMixin,
  subject: DS.attr 'string'
  created_at: DS.attr 'string'
  updated_at: DS.attr 'string'
  hasUnread: DS.attr 'boolean'

  users: DS.hasMany 'user'
  messages: DS.hasMany 'message'

Samolov.Conversation = DS.Model.extend
  subject: DS.attr 'string'

  users: DS.hasMany 'user'

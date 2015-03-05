Samolov.Message = DS.Model.extend Samolov.FormattedTimestampMixin,
  body: DS.attr 'string'
  created_at: DS.attr 'string'

  conversation: DS.belongsTo 'conversation'
  receipts: DS.hasMany 'receipt'
  sender:    DS.belongsTo 'user', async: true
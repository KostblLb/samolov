Samolov.MessageAdapter = Samolov.ApplicationAdapter.extend
  _resourceUrl: ->
    @_super().replace 'messages', 'conversaions/messages'

Samolov.Message = DS.Model.extend
  body: DS.attr 'string'

  sender:    DS.belongsTo 'user', async: true
  recipient: DS.belongsTo 'user', async: true
  _resourceUrl: ->
    @_super().replace 'messages', 'conversaions/messages'

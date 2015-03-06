Samolov.MessageSerializer = DS.ActiveModelSerializer.extend DS.EmbeddedRecordsMixin,
  serializeIntoHash: (hash, type, record, options) ->
    @_super hash, type, record, options
    Ember.merge hash, {
      'conversation_id': record.get('conversation.id')
    }
  attrs:
    receipts: { embedded: 'always' }


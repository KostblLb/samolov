Samolov.ConversationSerializer = DS.ActiveModelSerializer.extend DS.EmbeddedRecordsMixin,
  attrs:
    users: { serialize: 'ids',  deserialize: 'records' }
    messages: { embedded: 'always' }

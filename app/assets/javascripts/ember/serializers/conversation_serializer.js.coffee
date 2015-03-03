Samolov.ConversationSerializer = DS.ActiveModelSerializer.extend DS.EmbeddedRecordsMixin,
  attrs:
    users: { embedded: 'always' }

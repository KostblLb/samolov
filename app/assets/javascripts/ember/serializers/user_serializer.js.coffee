Samolov.UserSerializer = DS.ActiveModelSerializer.extend DS.EmbeddedRecordsMixin,
  attrs:
    friends:  { embedded: 'always' }

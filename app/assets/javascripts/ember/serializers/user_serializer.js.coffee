Samolov.UserSerializer = DS.ActiveModelSerializer.extend DS.EmbeddedRecordsMixin,
  attrs:
    friends:  { serialize: false, deserialize: 'records' }

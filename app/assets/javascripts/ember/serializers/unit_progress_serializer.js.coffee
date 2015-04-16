Samolov.UnitProgressSerializer = DS.ActiveModelSerializer.extend DS.EmbeddedRecordsMixin,
  attrs:
    user:    { embedded: 'always' }
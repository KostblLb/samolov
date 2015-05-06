Samolov.UnitProgressSerializer = DS.ActiveModelSerializer.extend DS.EmbeddedRecordsMixin,
  attrs:
    webinar:    { embedded: 'always' }
    user:       { embedded: 'always' }
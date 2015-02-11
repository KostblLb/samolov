Samolov.PartSerializer = DS.ActiveModelSerializer.extend DS.EmbeddedRecordsMixin,
  attrs:
    myProgress: { embedded: 'always' }

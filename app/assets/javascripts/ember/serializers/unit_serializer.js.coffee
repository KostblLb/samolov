Samolov.UnitSerializer = DS.ActiveModelSerializer.extend DS.EmbeddedRecordsMixin,
  attrs:
    myProgress: { embedded: 'always' }
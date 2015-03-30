Samolov.UnitSerializer = DS.ActiveModelSerializer.extend DS.EmbeddedRecordsMixin,
  attrs:
    webinar:    { embedded: 'always' }
    myProgress: { embedded: 'always' }
    unitProgresses: { embedded: 'always' }
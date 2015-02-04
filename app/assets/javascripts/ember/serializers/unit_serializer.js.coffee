Samolov.UnitSerializer = DS.ActiveModelSerializer.extend DS.EmbeddedRecordsMixin,
  attrs:
    webinar: { embedded: 'always' }
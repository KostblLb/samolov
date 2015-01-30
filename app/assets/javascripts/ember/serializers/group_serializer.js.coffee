Samolov.GroupSerializer = DS.ActiveModelSerializer.extend DS.EmbeddedRecordsMixin,
  attrs:
    adverts: { embedded: 'always' }
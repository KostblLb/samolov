Samolov.GroupSerializer = DS.ActiveModelSerializer.extend DS.EmbeddedRecordsMixin,
  attrs:
    adverts:  { embedded: 'always' }
    course:   { embedded: 'always' }
    scale:    { serialize: 'ids',  deserialize: 'records' }

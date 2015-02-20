Samolov.GroupSerializer = DS.ActiveModelSerializer.extend DS.EmbeddedRecordsMixin,
  attrs:
    adverts:  { embedded: 'always' }
    students: { embedded: 'always' }
    course:   { embedded: 'always' }
    courseProgresses: { embedded: 'always' }

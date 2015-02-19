Samolov.CoursePartProgressSerializer = DS.ActiveModelSerializer.extend DS.EmbeddedRecordsMixin,
  attrs:
    unitProgresses: { embedded: 'always' }

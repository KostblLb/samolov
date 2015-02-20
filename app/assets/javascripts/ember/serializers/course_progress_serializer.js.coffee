Samolov.CourseProgressSerializer = DS.ActiveModelSerializer.extend DS.EmbeddedRecordsMixin,
  attrs:
    coursePartProgresses: { embedded: 'always' }

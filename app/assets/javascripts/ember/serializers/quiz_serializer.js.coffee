Samolov.QuizSerializer = DS.ActiveModelSerializer.extend DS.EmbeddedRecordsMixin,
  attrs:
    myProgress: { embedded: 'always' }
    questions:  { embedded: 'always' }
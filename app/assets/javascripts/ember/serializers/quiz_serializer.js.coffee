Samolov.QuizSerializer = DS.ActiveModelSerializer.extend DS.EmbeddedRecordsMixin,
  attrs:
    questions: { embedded: 'always' }
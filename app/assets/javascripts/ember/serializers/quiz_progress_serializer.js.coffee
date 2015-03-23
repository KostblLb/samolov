Samolov.QuizProgressSerializer = DS.ActiveModelSerializer.extend DS.EmbeddedRecordsMixin,
  attrs:
    userAnswers: { embedded: 'always' }

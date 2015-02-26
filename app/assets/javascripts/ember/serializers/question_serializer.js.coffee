Samolov.QuestionSerializer =  DS.ActiveModelSerializer.extend DS.EmbeddedRecordsMixin,
  attrs:
    answers:        { embedded: 'always' }
    myAnswers:      { embedded: 'always' }
    correctAnswers: { embedded: 'always' }
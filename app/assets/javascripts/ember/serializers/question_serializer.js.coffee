Samolov.QuestionSerializer =  DS.ActiveModelSerializer.extend DS.EmbeddedRecordsMixin,
  attrs:
    answers: { embedded: 'always' }
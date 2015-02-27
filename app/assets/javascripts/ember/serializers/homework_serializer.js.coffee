Samolov.HomeworkProgressSerializer = DS.ActiveModelSerializer.extend DS.EmbeddedRecordsMixin,
  attrs:
    textAnswers:  { embedded: 'always' }
    tableAnswers: { embedded: 'always' }
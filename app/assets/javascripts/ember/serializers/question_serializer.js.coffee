Samolov.QuestionSerializer =  DS.ActiveModelSerializer.extend DS.EmbeddedRecordsMixin,
  attrs:
    answers:        { embedded: 'always' }
    myAnswer:       { embedded: 'always' }
    correctAnswers: { embedded: 'always' }
    correctAnswersReview: { embedded: 'always' }
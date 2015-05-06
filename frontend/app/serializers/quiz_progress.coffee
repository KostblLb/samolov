`import DS from "ember-data";` 
 
QuizProgressSerializer = DS.ActiveModelSerializer.extend DS.EmbeddedRecordsMixin,
  attrs:
    userAnswers: { embedded: 'always' }

 
`export default QuizProgressSerializer;`

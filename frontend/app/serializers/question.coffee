`import DS from "ember-data";` 
 
QuestionSerializer =  DS.ActiveModelSerializer.extend DS.EmbeddedRecordsMixin,
  attrs:
    answers:        { embedded: 'always' }
    myAnswer:       { embedded: 'always' }
    correctAnswers: { embedded: 'always' }
 
`export default QuestionSerializer;`

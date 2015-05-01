`import DS from "ember-data";` 
 
QuizSerializer = DS.ActiveModelSerializer.extend DS.EmbeddedRecordsMixin,
  attrs:
    myProgress: { embedded: 'always' }
    questions:  { embedded: 'always' }
 
`export default QuizSerializer;`

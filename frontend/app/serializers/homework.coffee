`import DS from "ember-data";` 
 
HomeworkProgressSerializer = DS.ActiveModelSerializer.extend DS.EmbeddedRecordsMixin,

  attrs:
    #textAnswers:  { embedded: 'always' }
    #tableAnswers: { embedded: 'always' }
    tasks:        { embedded: 'always' }
 
`export default HomeworkProgressSerializer;`

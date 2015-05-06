`import DS from "ember-data";` 
 
CourseSerializer = DS.ActiveModelSerializer.extend DS.EmbeddedRecordsMixin,
  attrs:
    myProgress: { embedded: 'always' }
    groups: {embedded: 'always'}

 
`export default CourseSerializer;`

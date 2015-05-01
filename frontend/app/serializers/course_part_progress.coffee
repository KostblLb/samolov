`import DS from "ember-data";` 
 
#CoursePartProgressSerializer = DS.ActiveModelSerializer.extend DS.EmbeddedRecordsMixin,
#  attrs:
#    unitProgresses: { embedded: 'always' }

 
`export default CoursePartProgressSerializer;`

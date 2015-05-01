`import DS from "ember-data";` 
 
#CourseProgressSerializer = DS.ActiveModelSerializer.extend DS.EmbeddedRecordsMixin,
#  attrs:
#    coursePartProgresses: { embedded: 'always' }

 
`export default CourseProgressSerializer;`

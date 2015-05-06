`import DS from "ember-data";` 
 
TaskSerializer = DS.ActiveModelSerializer.extend DS.EmbeddedRecordsMixin,
  attrs:
    subtasks: {embedded: 'always'}
 
`export default TaskSerializer;`

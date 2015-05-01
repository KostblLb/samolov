`import DS from "ember-data";` 
 
GroupSerializer = DS.ActiveModelSerializer.extend DS.EmbeddedRecordsMixin,
  attrs:
    adverts:  { embedded: 'always' }
    course:   { embedded: 'always' }
    scale:    { serialize: 'ids',  deserialize: 'records' }

 
`export default GroupSerializer;`

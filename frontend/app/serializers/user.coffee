`import DS from "ember-data";` 
 
UserSerializer = DS.ActiveModelSerializer.extend DS.EmbeddedRecordsMixin,
  attrs:
    friends:      { serialize: false, deserialize: 'records' }
    subscribtion: { embedded: 'always' }

 
`export default UserSerializer;`

`import DS from "ember-data";` 
 
ConversationSerializer = DS.ActiveModelSerializer.extend DS.EmbeddedRecordsMixin,
  attrs:
    users: { serialize: 'ids',  deserialize: 'records' }
    messages: { embedded: 'always' }

 
`export default ConversationSerializer;`

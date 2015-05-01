`import DS from "ember-data";` 
 
ScaleSerializer = DS.ActiveModelSerializer.extend DS.EmbeddedRecordsMixin,
  attrs:
    sections: { embedded: 'always' }

 
`export default ScaleSerializer;`

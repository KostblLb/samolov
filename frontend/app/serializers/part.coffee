`import DS from "ember-data";` 
 
PartSerializer = DS.ActiveModelSerializer.extend DS.EmbeddedRecordsMixin,
  attrs:
    myProgress: { embedded: 'always' }
    units: { embedded: 'always' }

 
`export default PartSerializer;`

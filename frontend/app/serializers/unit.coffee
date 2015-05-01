`import DS from "ember-data";` 
 
UnitSerializer = DS.ActiveModelSerializer.extend DS.EmbeddedRecordsMixin,
  attrs:
    myProgress: { embedded: 'always' }
 
`export default UnitSerializer;`

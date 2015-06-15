`import DS from "ember-data";`

UnitProgressSerializer = DS.ActiveModelSerializer.extend DS.EmbeddedRecordsMixin,
  attrs:
    webinar:    { embedded: 'always' }

`export default UnitProgressSerializer;`

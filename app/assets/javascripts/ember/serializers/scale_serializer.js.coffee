Samolov.ScaleSerializer = DS.ActiveModelSerializer.extend DS.EmbeddedRecordsMixin,
  attrs:
    sections: { embedded: 'always' }

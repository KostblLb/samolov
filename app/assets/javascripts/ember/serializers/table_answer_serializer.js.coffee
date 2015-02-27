Samolov.TableAnswerSerializer = DS.ActiveModelSerializer.extend DS.EmbeddedRecordsMixin,
  attrs:
    rows: { embedded: 'always' }
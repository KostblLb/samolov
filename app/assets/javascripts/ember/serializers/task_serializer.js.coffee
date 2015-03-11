Samolov.TaskSerializer = DS.ActiveModelSerializer.extend DS.EmbeddedRecordsMixin,
  attrs:
    subtasks: {embedded: 'always'}
`import SubtaskSerializer from '../../subtask'`

HomeworkSubtaskPositionProfileSerializer = SubtaskSerializer.extend DS.EmbeddedRecordsMixin,
  attrs:
    profileCompulsory: {embedded: 'always'}
    profileDesirable: {embedded: 'always'}

`export default HomeworkSubtaskPositionProfileSerializer`

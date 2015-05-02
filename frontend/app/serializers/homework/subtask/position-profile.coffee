`import SubtaskSerializer from '../../subtask'`

HomeworkSubtaskPositionProfileSerializer = SubtaskSerializer.extend
  attrs:
    profileCompulsory: {embedded: 'always'}
    profileDesirable: {embedded: 'always'}

`export default HomeworkSubtaskPositionProfileSerializer`

`import DS from 'ember-data'`
`import SubtaskSerializer from '../../subtask'`

HomeworkSubtaskSelectSerializer = SubtaskSerializer.extend
  attrs:
    options:  {embedded: 'always'}
    answers: { serialize: 'ids',  deserialize: 'records' }



`export default HomeworkSubtaskSelectSerializer`

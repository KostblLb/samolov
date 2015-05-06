`import DS from 'ember-data'`
`import SubtaskSerializer from '../../subtask'`

HomeworkSubtaskTableSerializer = SubtaskSerializer.extend
  attrs:
    rows: {embedded: 'always'}


`export default HomeworkSubtaskTableSerializer`

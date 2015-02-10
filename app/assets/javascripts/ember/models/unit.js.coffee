# for more details see: http://emberjs.com/guides/models/defining-models/

Samolov.Unit = DS.Model.extend
  name: DS.attr 'string'
  summary: DS.attr 'string'
  videoLink: DS.attr 'string'
  quiz: DS.belongsTo 'quiz'
  case: DS.belongsTo 'quiz'

  quizId: DS.attr 'string'
  caseId: DS.attr 'string'

#  myUnitProgressId: DS.attr 'string'
  myProgress: DS.belongsTo 'unit_progress'
  part: DS.belongsTo 'part', async: true
  webinar: DS.belongsTo 'webinar'


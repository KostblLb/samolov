Samolov.Question = DS.Model.extend
  text: DS.attr 'string'

  quiz: DS.belongsTo 'quiz'
Samolov.HomeworkProgress = Ember.model.extend

  order: DS.attr 'number'
  max_points: DS.attr 'number'

  textAnswers: DS.hasMany 'textAnswer'
  tableAnswers: DS.hasMany 'tableAnswer'

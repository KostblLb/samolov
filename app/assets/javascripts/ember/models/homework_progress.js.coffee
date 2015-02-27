Samolov.HomeworkProgress = DS.Model.extend

  points: DS.attr 'number'
  mistakes_counter: DS.attr 'number'
  correct_answer_counter: DS.attr 'number'
  textAnswers: DS.hasMany 'text_answer'
  tableAnswers: DS.hasMany 'table_answer'
  totalTasks: DS.attr 'number'
  tasks: DS.attr()


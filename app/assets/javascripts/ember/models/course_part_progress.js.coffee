# for more details see: http://emberjs.com/guides/models/defining-models/

Samolov.CoursePartProgress = DS.Model.extend Samolov.FormattedDeadlineMixin, Samolov.ProgressMixin,
  unitProgresses: DS.hasMany 'unit_progress', async:true
  deadline:   DS.attr 'string'


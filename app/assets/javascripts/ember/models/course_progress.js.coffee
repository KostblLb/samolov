# for more details see: http://emberjs.com/guides/models/defining-models/

Samolov.CourseProgress = DS.Model.extend Samolov.FormattedDeadlineMixin, Samolov.ProgressMixin,
  coursePartProgresses: DS.hasMany 'coursePartProgress', async: true
  isComplete: DS.attr 'boolean'
  deadline:   DS.attr 'string'
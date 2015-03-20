# for more details see: http://emberjs.com/guides/models/defining-models/

Samolov.CourseProgress = DS.Model.extend Samolov.ProgressMixin,
  coursePartProgresses: DS.hasMany 'coursePartProgress'
  isComplete: DS.attr 'boolean'
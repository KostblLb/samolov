`import DS from "ember-data";`
`import FormattedDeadlineMixin from "../mixins/formatted_deadline_mixin"`
`import ProgressMixin from "../mixins/progress_mixin"`


CourseProgress = DS.Model.extend FormattedDeadlineMixin, ProgressMixin,

  isComplete:           DS.attr 'boolean'
  courseBeginning:      DS.attr 'string'
  deadline:             DS.attr 'string'

  coursePartProgresses: DS.hasMany 'coursePartProgress', async: true

`export default CourseProgress;`

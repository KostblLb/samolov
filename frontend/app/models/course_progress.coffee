`import DS from "ember-data";`
`import FormattedDeadlineMixin from "../mixins/formatted_deadline_mixin"`
`import ProgressMixin from "../mixins/progress_mixin"`


CourseProgress = DS.Model.extend FormattedDeadlineMixin, ProgressMixin,
  coursePartProgresses: DS.hasMany 'coursePartProgress', async: true
  isComplete: DS.attr 'boolean'
  deadline:   DS.attr 'string'

`export default CourseProgress;`

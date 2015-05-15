`import DS from "ember-data";`
`import FormattedDeadlineMixin from "../mixins/formatted_deadline_mixin"`
`import ProgressMixin from "../mixins/progress_mixin"`

CoursePartProgress = DS.Model.extend FormattedDeadlineMixin, ProgressMixin,
  unitProgresses: DS.hasMany 'unit_progress', async:true
  partBeginning:  DS.attr 'string'
  deadline:       DS.attr 'string'

`export default CoursePartProgress;`

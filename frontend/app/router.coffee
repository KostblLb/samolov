`import Ember from 'ember'`
`import config from './config/environment'`

Router = Ember.Router.extend
  location: config.locationType


Router.map ->
  @route 'free'
  @route 'directors'

  @resource 'education', ->
    @resource 'order', path: 'order/:id'

    @resource 'users', ->
      @route 'show', path: ':id'
      @route 'edit'

    @resource 'courses'
    @resource 'course', path: 'courses/:id', ->
      @route 'buy'
      @resource 'unit', path: 'unit/:unit_id', ->
        @resource 'quiz', path: 'quiz/:quiz_id'
        @resource 'quiz_progress', path: 'quiz_progress/:quiz_progress_id'
        @resource 'question', path: 'question/:question_id'
        @resource 'homework_progress', path: 'homework_progress/:homework_progress_id'

    @resource 'homework_review', path: 'homework/:homework_progress_id'
    @resource 'quiz_review', path: 'quiz/:quiz_progress_id'

    @resource 'groups', ->
      @route 'show', path: ':id', ->
        @resource 'adverts', ->
          @route 'new'

    @resource 'scales', ->
      @route 'new'
      @resource 'scale', path: ':id', ->
        @route 'edit'

    @resource 'conversations', ->
      @route 'new'
      @resource 'conversation', path: ':id', ->
        @route 'show'

    @resource 'faq', ->
      @route 'show', path: ':id'

    @resource 'subscribtion', path: 'subscribtion/:id'

  @route 'Directors'

`export default Router`

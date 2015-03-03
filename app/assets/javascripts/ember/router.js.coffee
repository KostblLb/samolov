# For more information see: http://emberjs.com/guides/routing/

Samolov.Router.map ()->
  @route 'free'

  @resource 'order', path: 'order/:id'

  @resource 'users', ->
    @route 'show', path: ':id'
    @route 'edit'

  @resource 'messages', ->
    @route 'new'

  @resource 'courses'
  @resource 'course', path: 'courses/:id', ->
    @route 'buy'
    @resource 'part', path: 'part/:part_id'
    @resource 'unit', path: 'unit/:unit_id', ->
      @resource 'quiz', path: 'quiz/:quiz_id'
      @resource 'quiz_progress', path: 'quiz_progress/:quiz_progress_id'
      @resource 'question', path: 'question/:question_id'
      @resource 'homework_progress', path: 'homework_progress/:homework_progress_id'

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



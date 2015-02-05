# For more information see: http://emberjs.com/guides/routing/

Samolov.Router.map ()->
  @route 'free'

  @resource 'users', ->
    @route 'show', path: ':id'
    @route 'edit'

  @resource 'messages', ->
    @route 'new'

  @resource 'courses'
  @resource 'course', path: 'courses/:id', ->
    @resource 'part', path: 'part/:part_id'
    @resource 'unit', path: 'unit/:unit_id'

  @resource 'groups', ->
    @route 'show', path: ':id', ->
      @resource 'adverts', ->
        @route 'new'

  @resource 'question', path: 'question/:id'


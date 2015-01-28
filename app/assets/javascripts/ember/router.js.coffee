# For more information see: http://emberjs.com/guides/routing/

Samolov.Router.map ()->
  @route 'free'

  @resource 'users', ->
    @route 'show', path: ':id'
    @route 'edit'

  @resource 'messages', ->
    @route 'new'

  @resource 'courses', ->
    @route 'show', path: ':id'
# For more information see: http://emberjs.com/guides/routing/

Samolov.Router.map ()->
  @resource 'users', ->
    @route 'show', path: ':id'
    @route 'edit'

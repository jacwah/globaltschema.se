'use strict'

describe 'Directive: idEditor', ->

  # load the directive's module
  beforeEach module 'jacobsSchemaApp'

  scope = {}

  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()

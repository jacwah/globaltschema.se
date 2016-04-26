'use strict'

describe 'Controller: IdEditorCtrl', ->

  # load the controller's module
  beforeEach module 'jacobsSchemaApp'

  IdEditorCtrl = {}

  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    IdEditorCtrl = $controller 'IdEditorCtrl', {
      # place here mocked dependencies
    }


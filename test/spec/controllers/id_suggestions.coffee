'use strict'

describe 'Controller: IdSuggestionsCtrl', ->

  # load the controller's module
  beforeEach module 'jacobsSchemaApp'

  IdSuggestionsCtrl = {}

  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    IdSuggestionsCtrl = $controller 'IdSuggestionsCtrl', {
      # place here mocked dependencies
    }

  it 'should have a list of suggestions', ->
    expect(IdSuggestionsCtrl.list).not.toBe undefined


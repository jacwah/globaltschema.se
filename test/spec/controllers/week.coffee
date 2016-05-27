'use strict'

describe 'Controller: WeekCtrl', ->

  # load the controller's module
  beforeEach module 'jacobsSchemaApp'

  WeekCtrl = {}

  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    WeekCtrl = $controller 'WeekCtrl', {
      # place here mocked dependencies
    }


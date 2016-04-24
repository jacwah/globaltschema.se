'use strict'

describe 'Controller: ScheduleCtrl', ->

  # load the controller's module
  beforeEach module 'jacobsSchemaApp'

  ScheduleCtrl = {}

  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    ScheduleCtrl = $controller 'ScheduleCtrl', {
      # place here mocked dependencies
    }


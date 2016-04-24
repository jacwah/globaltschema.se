'use strict'

describe 'Service: scheduleImage', ->

  # load the service's module
  beforeEach module 'jacobsSchemaApp'

  # instantiate service
  scheduleImage = {}
  beforeEach inject (_scheduleImage_) ->
    scheduleImage = _scheduleImage_

  it 'should do something', ->
    expect(!!scheduleImage).toBe true

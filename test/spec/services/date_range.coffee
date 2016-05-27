'use strict'

describe 'Service: dateRange', ->

  # load the service's module
  beforeEach module 'jacobsSchemaApp'

  # instantiate service
  dateRange = {}
  beforeEach inject (_dateRange_) ->
    dateRange = _dateRange_

  it 'should do something', ->
    expect(!!dateRange).toBe true

'use strict'

describe 'Service: idSuggestions', ->

  # load the service's module
  beforeEach module 'jacobsSchemaApp'

  # instantiate service
  idSuggestions = {}
  beforeEach inject (_idSuggestions_) ->
    idSuggestions = _idSuggestions_

  it 'should do something', ->
    expect(!!idSuggestions).toBe true

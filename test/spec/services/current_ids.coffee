'use strict'

describe 'Service: currentIds', ->

  # load the service's module
  beforeEach module 'jacobsSchemaApp'

  # instantiate service
  currentIds = {}
  beforeEach inject (_currentIds_) ->
    currentIds = _currentIds_

  it 'should return added id', ->
    currentIds.add 'TJO'
    expect(currentIds.get()).toEqual ['TJO']

  it 'should return multiple added ids', ->
    currentIds.add 'TJO'
    currentIds.add 'JFU'

    expect(currentIds.get()).toEqual ['TJO', 'JFU']

  it 'should have removable ids', ->
    currentIds.add 'TJO'
    currentIds.add 'JFU'
    currentIds.remove 'TJO'

    expect(currentIds.get()).toEqual ['JFU']

  it 'can remove the last item', ->
    currentIds.add 'TJO'
    currentIds.add 'JFU'
    currentIds.removeLast()

    expect(currentIds.get()).toEqual ['TJO']

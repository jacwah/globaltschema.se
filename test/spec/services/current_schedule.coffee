'use strict'

describe 'Service: currentSchedule', ->

  # load the service's module
  beforeEach module 'jacobsSchemaApp'

  # instantiate service
  currentSchedule = {}
  beforeEach inject (_currentSchedule_) ->
    currentSchedule = _currentSchedule_

  it 'should return added id', ->
    currentSchedule.addId 'TJO'
    expect(currentSchedule.getIds()).toEqual ['TJO']

  it 'should return multiple added ids', ->
    currentSchedule.addId 'TJO'
    currentSchedule.addId 'JFU'

    expect(currentSchedule.getIds()).toEqual ['TJO', 'JFU']

  it 'should have removable ids', ->
    currentSchedule.addId 'TJO'
    currentSchedule.addId 'JFU'
    currentSchedule.removeId 'TJO'

    expect(currentSchedule.getIds()).toEqual ['JFU']

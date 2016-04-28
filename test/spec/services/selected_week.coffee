'use strict'

describe 'Service: selectedWeek', ->

  # load the service's module
  beforeEach ->
    module 'jacobsSchemaApp'
    jasmine.clock().install()

  afterEach ->
    jasmine.clock().uninstall()

  # instantiate service
  selectedWeek = {}
  beforeEach inject (_selectedWeek_) ->
    selectedWeek = _selectedWeek_

  it 'defaults to the current week on weekdays', ->
    date = moment('2016-04-25')
    jasmine.clock().mockDate date.toDate()
    expect(selectedWeek.get()).toEqual 17

  it 'defaults to the next week on weekends', ->
    date = moment('2016-04-30')
    jasmine.clock().mockDate(date.toDate())
    expect(selectedWeek.get()).toEqual 18

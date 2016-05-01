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

  describe 'default', ->

    it 'is the current week on mondays', ->
      date = moment('2016-04-25')
      jasmine.clock().mockDate date.toDate()
      expect(selectedWeek.get()).toEqual 17

    it 'is the current week on mondays', ->
      date = moment('2016-04-29')
      jasmine.clock().mockDate date.toDate()
      expect(selectedWeek.get()).toEqual 17

    it 'is the next week on saturdays', ->
      date = moment('2016-04-30')
      jasmine.clock().mockDate(date.toDate())
      expect(selectedWeek.get()).toEqual 18

    it 'is the next week on sundays', ->
      date = moment('2016-05-01')
      jasmine.clock().mockDate(date.toDate())
      expect(selectedWeek.get()).toEqual 18

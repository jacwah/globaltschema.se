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

    it 'is the current week on fridays', ->
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

  describe 'set', ->

    it 'sets a correct week', ->
      date = moment('2016-04-25')
      jasmine.clock().mockDate date.toDate()
      selectedWeek.set 20
      expect(selectedWeek.get()).toEqual 20

    it 'throws TypeError for non-number values', ->
      expect(() -> selectedWeek.set undefined).toThrowError(TypeError)

    it 'throws RangeError if week out of range', ->
      expect(() -> selectedWeek.set 54).toThrowError(RangeError)

'use strict'

describe 'Service: dateRange', ->

  # load the service's module
  beforeEach module 'jacobsSchemaApp'

  momentEqualityTester = (a, b) ->
    if moment.isMoment(a) and moment.isMoment(b)
      return a.isSame(b, 'day')
    else
      return undefined

  # instantiate service
  dateRange = {}
  beforeEach inject (_dateRange_) ->
    dateRange = _dateRange_
    jasmine.addCustomEqualityTester(momentEqualityTester)

  afterEach ->

  describe 'terms', ->

    it 'identifies fall term', ->
      date = moment('2015-07-02')
      expect(dateRange.isFallTerm(date)).toBe(true)

    it 'identifies spring term', ->
      date = moment('2015-06-30')
      expect(dateRange.isFallTerm(date)).toBe(false)

  describe 'minDate', ->

    it 'works in fall term', ->
      date = moment('2015-08-01')
      expect(dateRange.minDate(date)).toEqual(moment('2015-07-01'))

    it 'works in spring term', ->
      date = moment('2016-05-01')
      expect(dateRange.minDate(date)).toEqual(moment('2015-07-01'))

  describe 'maxDate', ->

    it 'works in fall term', ->
      date = moment('2015-08-01')
      expect(dateRange.maxDate(date)).toEqual(moment('2016-07-01'))

    it 'works in spring term', ->
      date = moment('2016-05-01')
      expect(dateRange.maxDate(date)).toEqual(moment('2016-07-01'))

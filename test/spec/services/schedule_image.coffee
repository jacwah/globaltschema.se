'use strict'

describe 'Service: scheduleImage', ->

  # load the service's module
  beforeEach module 'jacobsSchemaApp'

  # instantiate service
  scheduleImage = {}
  beforeEach inject (_scheduleImage_) ->
    scheduleImage = _scheduleImage_

  describe 'returned urls', ->

    # Are two urls equal (includeing parameters after '?')?
    urlsAreEqual = (a, b) ->
      getParams = (url) ->
        split = url.split('?')

        if split.length > 2
          throw new Error('Too many \'?\' in url')

        if split.length == 1
          split.push []

        return [split[0], split[1].split('&').sort()]

      unless typeof a == 'string' and typeof b == 'string'
        return undefined

      [aPath, aParams] = getParams a
      [bPath, bParams] = getParams b
      if aPath != bPath or aParams.length != bParams.length
        return false

      for i in [0..aParams.length]
        if aParams[i] != bParams[i]
          return false

      return true

    beforeEach ->
      jasmine.addCustomEqualityTester urlsAreEqual

    it 'should be correct', ->
      url = 'http://www.novasoftware.se/ImgGen/schedulegenerator.aspx?format=png&schoolid=29120/sv-se&type=-1&id=na14a&period=&week=16&mode=0&printer=0&colors=32&head=0&clock=0&foot=0&day=0&width=730&height=640'
      options =
        id: 'na14a'
        week: 16
        width: 730
        height: 640

      expect(scheduleImage.getUrl options).toEqual url

    it 'should be tested for equality correctly', ->
      expect('http://example.com/?a=1&b=2').toEqual 'http://example.com/?b=2&a=1'
      expect('http://example.com/?a=1&b=2').not.toEqual 'http://example.com/?b=1&a=1'

  describe 'isValidOptions', ->
    isValidExcluding = (key) ->
      opts = id: 'na14b', week: 18, width: 480, height: 480
      if key?
        delete opts[key]
      return scheduleImage.isValidOptions opts

    it 'is true when id, week, width and height are specified', ->
      expect(isValidExcluding()).toBe true

    it 'is false when id is omitted', ->
      expect(isValidExcluding 'id').toBe false

    it 'is false when week is omitted', ->
      expect(isValidExcluding 'week').toBe false

    it 'is false when width is omitted', ->
      expect(isValidExcluding 'width').toBe false

    it 'is false when height is omitted', ->
      expect(isValidExcluding 'height').toBe false

  it 'returns the empty string when isValidOptions is false', ->
    scheduleImage.isValidOptions = -> false
    expect(scheduleImage.getUrl()).toEqual ''

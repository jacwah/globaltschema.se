'use strict'

describe 'Service: currentIds', ->

  # load the service's module
  beforeEach module 'jacobsSchemaApp'

  # instantiate service
  currentIds = {}
  beforeEach inject (_currentIds_) ->
    currentIds = _currentIds_
    currentIds.ids = []

  localStorageService = {}

  beforeEach inject (_localStorageService_) ->
    localStorageService = _localStorageService_
    localStorageService.clearAll()

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

  describe 'local storage', ->

    describe 'add and remove', ->

      expectLsSetTo = (value) ->
        expect(localStorageService.set.calls.mostRecent().args).toEqual([currentIds.KEY_LAST_IDS, value])

      beforeEach ->
        spyOn(localStorageService, 'set').and.returnValue(null)

      it 'sets a single id', ->
        currentIds.add('TJO')
        expectLsSetTo 'TJO'

      it 'sets multiple ids', ->
        currentIds.add 'TJO'
        currentIds.add 'JFU'
        expectLsSetTo 'TJO,JFU'

      it 'removes a lone id', ->
        currentIds.ids = ['TJO']
        currentIds.remove 'TJO'
        expectLsSetTo ''

      it 'removes the first id', ->
        currentIds.ids = ['TJO', 'JFU', 'LMA']
        currentIds.remove 'TJO'
        expectLsSetTo 'JFU,LMA'

      it 'removes the last id', ->
        currentIds.ids = ['TJO', 'JFU', 'LMA']
        currentIds.remove 'LMA'
        expectLsSetTo 'TJO,JFU'

    describe 'getDefault', ->

      it 'is empty if local storage key is empty', ->
        spyOn(localStorageService, 'get').and.returnValue('')
        expect(currentIds.getDefault()).toEqual []

      it 'returns a single id if in local storage', ->
        spyOn(localStorageService, 'get').and.returnValue('TJO')
        expect(currentIds.getDefault()).toEqual ['TJO']

      it 'returns multiple ids if in local storage', ->
        spyOn(localStorageService, 'get').and.returnValue('TJO,JFU')
        expect(currentIds.getDefault()).toEqual ['TJO', 'JFU']


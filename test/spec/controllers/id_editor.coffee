'use strict'

describe 'Controller: IdEditorCtrl', ->

  # load the controller's module
  beforeEach module 'jacobsSchemaApp'

  IdEditorCtrl = {}
  $scope = {}
  currentIds = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope, _currentIds_) ->
    $scope = $rootScope.$new()
    currentIds = _currentIds_
    IdEditorCtrl = $controller 'IdEditorCtrl', {
      $scope: $scope
    }

  describe 'inputChanged', ->

    beforeEach ->
        spyOn(currentIds, 'add')

    test = (input, expectedList, expectedInput) ->
      expectedArgs = ([e] for e in expectedList)
      $scope.idInput = input
      IdEditorCtrl.inputChanged()
      expect(currentIds.add.calls.allArgs()).toEqual expectedArgs
      expect($scope.idInput).toEqual expectedInput

    it 'adds an id using space', ->
      test 'na14a ', ['na14a'], ''

    it 'adds two ids at once separated by space', ->
      test 'na14a na14b ', ['na14a', 'na14b'], ''

    it 'collapses multiple spaces', ->
      test 'na14a    na14b ', ['na14a', 'na14b'], ''

    it 'adds an id using tabs', ->
      test 'na14a\t', ['na14a'], ''

    it 'adds one and preserves the other if only one space', ->
      test 'na14a na14b', ['na14a'], 'na14b'

  describe 'pressing enter', ->

    beforeEach ->
        spyOn(currentIds, 'add')

    test = (input, key, expectedList, expectedInput) ->
      expectedArgs = ([e] for e in expectedList)
      $scope.idInput = input
      IdEditorCtrl.keyPressed(key: key)
      expect(currentIds.add.calls.allArgs()).toEqual expectedArgs
      expect($scope.idInput).toEqual expectedInput

    it 'adds an id', ->
      test 'na14a', 'Enter', ['na14a'], ''

  describe 'pressing backspace', ->

    beforeEach ->
      spyOn(currentIds, 'removeLast')

    it 'calls currentIds.removeLast when caret at beginning of input', ->
      $scope.idInputCaret = 0
      IdEditorCtrl.keyPressed(key: 'Backspace')
      expect(currentIds.removeLast).toHaveBeenCalled()

    it 'does not call removeLast when caret is not at beginning of input', ->
      $scope.idInputCaret = 1
      IdEditorCtrl.keyPressed(key: 'Backspace')
      expect(currentIds.removeLast).not.toHaveBeenCalled()

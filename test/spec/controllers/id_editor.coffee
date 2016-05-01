'use strict'

describe 'Controller: IdEditorCtrl', ->

  # load the controller's module
  beforeEach module 'jacobsSchemaApp'

  IdEditorCtrl = {}
  $scope = {}
  idList = []

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    $scope = $rootScope.$new()
    idList = []
    IdEditorCtrl = $controller 'IdEditorCtrl', {
      $scope: $scope
      currentIds:
        add: (id) ->
          idList.push(id)
    }

  describe 'inputChanged', ->

    test = (input, expectedList, expectedInput) ->
      $scope.idInput = input
      IdEditorCtrl.inputChanged()
      expect(idList).toEqual expectedList
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

  describe 'keyPressed', ->
    test = (input, key, expectedList, expectedInput) ->
      $scope.idInput = input
      IdEditorCtrl.keyPressed(key: key)
      expect(idList).toEqual expectedList
      expect($scope.idInput).toEqual expectedInput

    it 'adds an id when enter is pressed', ->
      test 'na14a', 'Enter', ['na14a'], ''


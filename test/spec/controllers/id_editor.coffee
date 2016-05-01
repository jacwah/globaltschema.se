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

  it 'adds an id using space', ->
    $scope.idInput = 'na14a '
    IdEditorCtrl.inputChanged()
    expect(idList).toEqual ['na14a']
    expect($scope.idInput).toEqual ''


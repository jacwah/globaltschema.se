'use strict'

###*
 # @ngdoc function
 # @name jacobsSchemaApp.controller:IdEditorCtrl
 # @description
 # Edit schedule ids as entities. Inspired by StackExchanges' tag
 # editor.
###
angular.module 'jacobsSchemaApp'
  .controller 'IdEditorCtrl', ($scope, currentIds) ->
    $scope.currentIds = currentIds
    $scope.idInput = ''

    @addInput = ->
      currentIds.add($scope.idInput.trim())
      $scope.idInput = ""

    @inputChanged = ->
      id = $scope.idInput
      if id.endsWith(' ') and id.trim().length > 0
        @addInput()

    @keyPressed = (event) ->
      if $scope.idInputCaret == 0 and event.key == 'Backspace'
        currentIds.removeLast()
      if event.key == 'Enter'
        @addInput()

    return

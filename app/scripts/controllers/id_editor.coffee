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

    @inputChanged = ->
      id = $scope.idInput
      if id.endsWith(' ') and id.trim().length > 0
        currentIds.add(id.trim())
        $scope.idInput = ""

    @keyPressed = (event) ->
      if $scope.idInput.length == 0 and event.key == 'Backspace'
        currentIds.removeLast()

    return

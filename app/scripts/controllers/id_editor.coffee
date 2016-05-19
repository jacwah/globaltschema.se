'use strict'

###*
 # @ngdoc function
 # @name jacobsSchemaApp.controller:IdEditorCtrl
 # @description
 # Edit schedule ids as entities. Inspired by StackExchanges' tag
 # editor.
###

BACKSPACE = 8
ENTER = 13

angular.module 'jacobsSchemaApp'
  .controller 'IdEditorCtrl', ($scope, currentIds) ->
    $scope.currentIds = currentIds
    $scope.idInput = ''

    @inputChanged = ->
      # Handle cases e.g. when user pastes "na14a na14b "
      ids = $scope.idInput.trimLeft().split(/\s+/)
      # The user might paste "na14a na14b", na14b will still be in input
      $scope.idInput = ids.pop()

      for id in ids
        currentIds.add(id)

    @keyPressed = (event) ->
      switch event.which
        when BACKSPACE
          if $scope.idInputCaret == 0
            currentIds.removeLast()
        when ENTER
          id = $scope.idInput.toString().trim()
          if id.length > 0
            currentIds.add(id)
            $scope.idInput = ''

    return

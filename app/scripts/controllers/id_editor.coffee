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
      # Handle cases e.g. when user pastes "na14a na14b "
      ids = $scope.idInput.trimLeft().split(' ')
      if ids.length
        # The user might paste "na14a na14b", na14b will still be in input
        $scope.idInput = ids.splice(-1)
      else
        return

      for id in ids[..1]
        currentIds.add(id)

    @keyPressed = (event) ->
      switch event.key
        when 'Backspace'
          if $scope.idInputCaret == 0
            currentIds.removeLast()
        when 'Enter'
          currentIds.add($scope.idInput.trim())
          $scope.idInput = ""

    return

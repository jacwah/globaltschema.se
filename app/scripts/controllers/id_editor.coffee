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

    @inputChanged = ->
      id = $scope.idInput
      if id.endsWith(' ') and id.trim().length > 0
        currentIds.add(id.trim())
        $scope.idInput = ""

    return

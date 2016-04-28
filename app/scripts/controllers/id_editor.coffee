'use strict'

###*
 # @ngdoc function
 # @name jacobsSchemaApp.controller:IdEditorCtrl
 # @description
 # Edit schedule ids as entities. Inspired by StackExchanges' tag
 # editor.
###
angular.module 'jacobsSchemaApp'
  .controller 'IdEditorCtrl', ($scope, currentSchedule) ->
    $scope.currentSchedule = currentSchedule

    @inputChanged = ->
      id = $scope.idInput
      if id.endsWith(' ') and id.trim().length > 0
        currentSchedule.addId(id.trim())
        $scope.idInput = ""

    return

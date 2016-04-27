'use strict'

###*
 # @ngdoc function
 # @name jacobsSchemaApp.controller:IdEditorCtrl
 # @description
 # Edit schedule ids as entities. Inspired by StackExchanges' tag
 # editor.
###
angular.module 'jacobsSchemaApp'
  .controller 'IdEditorCtrl', ($scope) ->
    @ids = ['tjo', 'jfu']

    @inputChanged = ->
      id = $scope.idInput
      if id.endsWith(' ') and id.trim().length > 0
        @ids.push(id.trim())  
        $scope.idInput = ""

    @removeId = (id) ->
      @ids.splice(@ids.indexOf(id), 1)

    return

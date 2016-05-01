'use strict'

###*
 # @ngdoc function
 # @name jacobsSchemaApp.controller:IdSuggestionsCtrl
 # @description
 # # IdSuggestionsCtrl
 # Controller of the jacobsSchemaApp
###
angular.module 'jacobsSchemaApp'
  .controller 'IdSuggestionsCtrl', (idSuggestions) ->
    @list = idSuggestions.list
    return

'use strict'

###*
 # @ngdoc function
 # @name jacobsSchemaApp.controller:IdSuggestionsCtrl
 # @description
 # # IdSuggestionsCtrl
 # Controller of the jacobsSchemaApp
###
angular.module 'jacobsSchemaApp'
  .controller 'IdSuggestionsCtrl', ($http, $log) ->
    @list = []
    path = '/ids.json'

    $http.get(path)
      .then (response) =>
        @list = Array.concat(@list, response.data)
      .then null, (response) =>
        $log.error "Failed to get #{path}", response

    return

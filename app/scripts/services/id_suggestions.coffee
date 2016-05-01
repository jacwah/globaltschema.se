'use strict'

###*
 # @ngdoc service
 # @name jacobsSchemaApp.idSuggestions
 # @description
 # # idSuggestions
 # Service in the jacobsSchemaApp.
###
angular.module 'jacobsSchemaApp'
  .service 'idSuggestions', ($http, $log) ->
    @list = []
    path = '/ids.json'

    $http.get(path)
      .then (response) =>
        @list.push(response.data...)
      .then null, (response) =>
        $log.error "Failed to get #{path}", response

    return

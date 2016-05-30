'use strict'

###*
 # @ngdoc directive
 # @name jacobsSchemaApp.directive:idEditor
 # @description
 # # idEditor
###
angular.module 'jacobsSchemaApp'
  .directive 'idEditor', ->
    restrict: 'E'
    templateUrl: 'views/id_editor.html'
    link: (scope, element, attrs) ->
      return

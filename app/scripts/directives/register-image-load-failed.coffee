'use strict'

###*
 # @ngdoc directive
 # @name jacobsSchemaApp.directive:registerImageLoadFailed
 # @description
 # # registerImageLoadFailed
###
angular.module 'jacobsSchemaApp'
  .directive 'registerImageLoadFailed', ->
    restrict: 'A'
    template: '<div></div>'
    link: (scope, element, attrs) ->
      scope.imageLoadFailed = false

      element.bind('error', (event) ->
        scope.imageLoadFailed = true
        scope.$apply()
      )


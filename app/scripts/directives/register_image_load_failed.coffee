'use strict'

###*
 # @ngdoc directive
 # @name jacobsSchemaApp.directive:registerImageLoadFailed
 # @description
 # # registerImageLoadFailed
###
angular.module 'jacobsSchemaApp'
  .directive 'registerImageLoadFailed', ($timeout) ->
    restrict: 'A'
    link: (scope, element, attrs) ->
      scope.imageLoadFailed = false

      element.bind('error abort', (event) ->
        scope.imageLoadFailed = true
        scope.$apply()
      )

      $timeout(() ->
        if !element[0].complete
          scope.imageLoadFailed = true
      , 5000)


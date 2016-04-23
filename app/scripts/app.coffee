'use strict'

###*
 # @ngdoc overview
 # @name jacobsSchemaApp
 # @description
 # # jacobsSchemaApp
 #
 # Main module of the application.
###
angular
  .module 'jacobsSchemaApp', [
    'ngMessages',
    'ngRoute',
    'ngTouch'
  ]
  .config ($routeProvider) ->
    $routeProvider
      .when '/',
        templateUrl: 'views/main.html'
        controller: 'MainCtrl'
        controllerAs: 'main'
      .when '/about',
        templateUrl: 'views/about.html'
        controller: 'AboutCtrl'
        controllerAs: 'about'
      .otherwise
        redirectTo: '/'


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
    'ngTouch',
    'leodido.caretAware',
    'LocalStorageModule'
  ]
  .config ($routeProvider, localStorageServiceProvider) ->
    $routeProvider
      .when '/',
        templateUrl: 'views/schedule.html'
      .otherwise
        redirectTo: '/'
    localStorageServiceProvider
      .setPrefix 'jacobsSchema'

  .run ->
    moment.locale 'sv'


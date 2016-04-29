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
    'leodido.caretAware'
  ]
  .config ($routeProvider) ->
    $routeProvider
      .when '/',
        templateUrl: 'views/schedule.html'
        controller: 'ScheduleCtrl'
        controllerAs: 'schedule'
      .when '/about',
        templateUrl: 'views/about.html'
        controller: 'AboutCtrl'
        controllerAs: 'about'
      .otherwise
        redirectTo: '/'
  .run ->
    moment.locale 'sv'


'use strict'

###*
 # @ngdoc function
 # @name jacobsSchemaApp.controller:ScheduleCtrl
 # @description
 # # ScheduleCtrl
 # Controller of the jacobsSchemaApp
###
angular.module 'jacobsSchemaApp'
  .controller 'ScheduleCtrl', (scheduleImage) ->
    @options =
      id: 'na14a'
      week: 16
      width: 730
      height: 640

    @getUrl = () -> scheduleImage.getUrl @options

    return

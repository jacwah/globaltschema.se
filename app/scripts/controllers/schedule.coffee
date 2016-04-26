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

    @idSuggestions = ['na14a', 'na14b']

    @getUrl = -> scheduleImage.getUrl @getOptions()

    @getOptions = ->
      return @options

    return

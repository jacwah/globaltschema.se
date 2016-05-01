'use strict'

###*
 # @ngdoc function
 # @name jacobsSchemaApp.controller:ScheduleCtrl
 # @description
 # # ScheduleCtrl
 # Controller of the jacobsSchemaApp
###
angular.module 'jacobsSchemaApp'
  .controller 'ScheduleCtrl', (scheduleImage, currentIds, selectedWeek) ->
    @options =
      width: 730
      height: 640

    @idSuggestions = ['na14a', 'na14b']

    @getUrl = -> scheduleImage.getUrl @getOptions()

    @getOptions = ->
      id = currentIds.get().join(',')
      opts = @options
      opts.id = id
      opts.week = selectedWeek.get()
      return opts

    return

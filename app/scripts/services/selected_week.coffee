'use strict'

###*
 # @ngdoc service
 # @name jacobsSchemaApp.selectedWeek
 # @description
 # # selectedWeek
 # Service in the jacobsSchemaApp.
###
angular.module 'jacobsSchemaApp'
  .service 'selectedWeek', ->
    @get = ->
      @selected or @getDefault()

    @getDefault = ->
      now = moment()

      # Use next week saturday and sunday
      if now.isoWeekday() > 5
        now.add 1, 'weeks'

      return now.week()

    return

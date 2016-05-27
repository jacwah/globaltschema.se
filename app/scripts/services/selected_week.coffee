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
      @_selected or @getDefault()

    @set = (week) ->
      if typeof week != 'number'
        throw TypeError 'Week must be number'

      if 1 > week or 53 < week
        throw RangeError 'Week out of range'

      @_selected = week

    @getDefault = ->
      now = moment()

      # Use next week saturday and sunday
      if now.isoWeekday() > 5
        now.add 1, 'weeks'

      return now.week()

    return

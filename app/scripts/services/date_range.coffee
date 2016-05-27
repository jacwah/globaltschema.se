'use strict'

###*
 # @ngdoc service
 # @name jacobsSchemaApp.dateRange
 # @description
 # # dateRange
 # Service in the jacobsSchemaApp.
###
angular.module 'jacobsSchemaApp'
  .service 'dateRange', ->
    pivot = month: 6, day: 1

    @isFallTerm = (date) ->
      return date.set(pivot).isBefore(date)

    @minDate = (dateWithinSemester) ->
      if not @isFallTerm(dateWithinSemester)
        dateWithinSemester.subtract(1, 'years')

      return dateWithinSemester.set(pivot)

    @maxDate = (dateWithinSemester) ->
      if @isFallTerm(dateWithinSemester)
        dateWithinSemester.add(1, 'years')

      return dateWithinSemester.set(pivot)

    return

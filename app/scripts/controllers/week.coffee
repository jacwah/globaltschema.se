'use strict'

###*
 # @ngdoc function
 # @name jacobsSchemaApp.controller:WeekCtrl
 # @description
 # # WeekCtrl
 # Controller of the jacobsSchemaApp
###
angular.module 'jacobsSchemaApp'
  .controller 'WeekCtrl', ($scope, selectedWeek, dateRange) ->
    $scope.week = selectedWeek.get()

    @asRangeString = ->
      format = 'D MMM'
      data = $('#week-picker').data('DateTimePicker')
      if data.date
        date = data.date()
        if date
          f = (n) -> date.isoWeekday(n).format(format)
          return "#{f 1} - #{f 5}"
      return ''

    $('#week-picker').datetimepicker({
      #format: 'w' # shows no picker
      format: 'D MMM'
      defaultDate: moment().week(selectedWeek.get())
      locale: 'sv'
      calendarWeeks: true
      minDate: dateRange.minDate(moment())
      maxDate: dateRange.maxDate(moment())
    })
    $('#week-picker').on 'dp.change', (event) ->
      $scope.$apply ->
        $scope.week = event.date.week()
        selectedWeek.set($scope.week)

    return

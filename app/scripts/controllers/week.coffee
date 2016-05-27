'use strict'

###*
 # @ngdoc function
 # @name jacobsSchemaApp.controller:WeekCtrl
 # @description
 # # WeekCtrl
 # Controller of the jacobsSchemaApp
###
angular.module 'jacobsSchemaApp'
  .controller 'WeekCtrl', ($scope, selectedWeek) ->
    $scope.week = selectedWeek.get()

    @asRangeString = () ->
      format = 'D MMM'
      data = $('#week-picker').data('DateTimePicker')
      if data.date
        date = data.date()
        if date
          return "#{date.day(0).format(format)} - #{date.day(6).format(format)}"
      return ''

    $('#week-picker').datetimepicker({
      format: 'D MMM'
      defaultDate: moment().week(selectedWeek.get())
      locale: 'sv'
    })
    $('#week-picker').on 'dp.change', (event) ->
      $scope.$apply ->
        $scope.week = event.date.week()
        selectedWeek.set($scope.week)

    return

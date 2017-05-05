'use strict'

###*
 # @ngdoc function
 # @name jacobsSchemaApp.controller:ScheduleCtrl
 # @description
 # # ScheduleCtrl
 # Controller of the jacobsSchemaApp
###
angular.module 'jacobsSchemaApp'
  .controller 'ScheduleCtrl', ($scope, $window, scheduleImage, currentIds, selectedWeek) ->
    @idSuggestions = ['na14a', 'na14b']

    @getUrl = -> scheduleImage.getUrl @getOptions()

    @getOptions = ->
      opts =
        if $scope.displaySize
          width: $scope.displaySize.width, height: $scope.displaySize.height
        else {}

      opts.id = currentIds.get().join(',')
      opts.week = selectedWeek.get()
      return opts

    @updateSize = ->
      scaleHeight = (width, height, newWidth) ->
        Math.round(height * newWidth / width)

      width = $window.innerWidth
      height = $window.innerHeight
      minWidth = 480
      maxWidth = 1140 # from css

      if width < minWidth
        height = scaleHeight width, height, minWidth
        width = minWidth
      else if width > maxWidth
        height = scaleHeight width, height, maxWidth
        width = maxWidth

      $scope.displaySize = {width, height}
      $scope.$apply()

    # NO_DEBOUNCE useful in testing
    if not $scope._NO_DEBOUNCE
      @updateSize = _.debounce(@updateSize, 100)

    angular.element($window).on 'resize', @updateSize
    @updateSize()

    return

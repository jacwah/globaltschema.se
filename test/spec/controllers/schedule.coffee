'use strict'

describe 'Controller: ScheduleCtrl', ->

  # load the controller's module
  beforeEach module 'jacobsSchemaApp'

  ScheduleCtrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($rootScope) ->
    scope = $rootScope.$new()
    scope._NO_DEBOUNCE = true
    ScheduleCtrl = null

  withWindow = (w) ->
    inject ($controller) ->
      ScheduleCtrl = $controller 'ScheduleCtrl', {
        $window: w
        $scope: scope
      }

  describe 'schedule size', ->
    it 'sets size to window size for medium sizes', ->
      width = 800
      height = 600
      withWindow innerWidth: width, innerHeight: height
      expect(scope.displaySize).toEqual {width, height}

    it 'reduce size for extra large displays', ->
      width = 4000
      height = 3000
      withWindow innerWidth: width, innerHeight: height
      expect(scope.displaySize.width).toBeLessThan width
      expect(scope.displaySize.height).toBeLessThan height

    it 'increase size for small displays', ->
      width = 150
      height = 200
      withWindow innerWidth: width, innerHeight: height
      expect(scope.displaySize.width).toBeGreaterThan width
      expect(scope.displaySize.height).toBeGreaterThan height

    it 'preserves aspect ratio for extra large displays', ->
      width = 4000
      height = 3000
      withWindow innerWidth: width, innerHeight: height
      expect(scope.displaySize.width / scope.displaySize.height).toEqual(width / height)

    it 'preserves aspect ratio for small displays', ->
      width = 150
      height = 200
      withWindow innerWidth: width, innerHeight: height
      expect(scope.displaySize.width / scope.displaySize.height).toEqual(width / height)

    it 'updates size on resize event', ->
      width0 = 800
      height0 = 600
      newWidth = 1000
      newHeight = 1200
      window = innerWidth: width0, innerHeight: height0
      withWindow window
      expect(scope.displaySize).toEqual {width: width0, height: height0}

      window.innerWidth = newWidth
      window.innerHeight = newHeight
      angular.element(window).trigger('resize')
      expect(scope.displaySize).toEqual {width: newWidth, height: newHeight}

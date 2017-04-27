'use strict'

describe 'Directive: registerImageLoadFailed', ->

  # load the directive's module
  beforeEach module 'jacobsSchemaApp'

  scope = {}
  element = {}
  $timeout = {}

  beforeEach inject ($rootScope, _$timeout_, $compile) ->
    scope = $rootScope.$new()
    $timeout = _$timeout_
    element = angular.element '<div register-image-load-failed></div>'
    element = $compile(element) scope

  it 'should set imageLoadFailed after error event', ->
    expect(scope.imageLoadFailed).toBe false
    element.trigger 'error'
    expect(scope.imageLoadFailed).toBe true

  it 'should time out if incomplete after 5 seconds', ->
    element[0].complete = false
    expect(scope.imageLoadFailed).toBe false
    $timeout.flush(5000)
    expect(scope.imageLoadFailed).toBe true

  it 'should not time out if incomplete after 4 seconds', ->
    element[0].complete = false
    expect(scope.imageLoadFailed).toBe false
    $timeout.flush(4000)
    expect(scope.imageLoadFailed).toBe false

  it 'should not time out if complete after 5 seconds', ->
    element[0].complete = true
    expect(scope.imageLoadFailed).toBe false
    $timeout.flush(5000)
    expect(scope.imageLoadFailed).toBe false

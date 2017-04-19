'use strict'

describe 'Directive: registerImageLoadFailed', ->

  # load the directive's module
  beforeEach module 'jacobsSchemaApp'

  scope = {}

  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()

  it 'should set imageLoadFailed after error event', inject ($compile) ->
    element = angular.element '<div register-image-load-failed></div>'
    element = $compile(element) scope
    expect(scope.imageLoadFailed).toBe false
    $(element).trigger 'error'
    expect(scope.imageLoadFailed).toBe true

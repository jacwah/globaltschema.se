'use strict'

###*
 # @ngdoc service
 # @name jacobsSchemaApp.currentIds
 # @description
 # # currentIds
 # Service in the jacobsSchemaApp.
###
angular.module 'jacobsSchemaApp'
  .service 'currentIds', ->
    @ids = []

    @add = (id) ->
      unless id in @ids
        @ids.push(id)

    @remove = (id) ->
      @ids.splice(@ids.indexOf(id), 1)

    @removeLast = ->
      @ids.pop()

    @get = ->
      @ids

    return

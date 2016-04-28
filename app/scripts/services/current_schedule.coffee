'use strict'

###*
 # @ngdoc service
 # @name jacobsSchemaApp.currentSchedule
 # @description
 # # currentSchedule
 # Service in the jacobsSchemaApp.
###
angular.module 'jacobsSchemaApp'
  .service 'currentSchedule', ->
    @ids = []

    @addId = (id) ->
      unless id in @ids
        @ids.push(id)

    @removeId = (id) ->
      @ids.splice(@ids.indexOf(id), 1)

    @getIds = ->
      @ids

    return

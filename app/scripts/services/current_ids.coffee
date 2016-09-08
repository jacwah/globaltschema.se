'use strict'

###*
 # @ngdoc service
 # @name jacobsSchemaApp.currentIds
 # @description
 # # currentIds
 # Service in the jacobsSchemaApp.
###
angular.module 'jacobsSchemaApp'
  .service 'currentIds', (localStorageService) ->
    @KEY_LAST_IDS = 'lastIds'

    @getDefault = ->
      lsIds = localStorageService.get(@KEY_LAST_IDS)
      return if lsIds then lsIds.split(',') else []

    @ids = @getDefault()

    @_setLsFromArray = (ids) ->
      localStorageService.set(@KEY_LAST_IDS, ids.join(','))

    @add = (id) ->
      unless id in @ids
        @ids.push(id)
        @_setLsFromArray(@ids)

    @remove = (id) ->
      @ids.splice(@ids.indexOf(id), 1)
      @_setLsFromArray(@ids)

    @removeLast = ->
      @ids.pop()

    @get = ->
      @ids

    return

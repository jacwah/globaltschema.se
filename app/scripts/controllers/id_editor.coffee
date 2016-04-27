'use strict'

###*
 # @ngdoc function
 # @name jacobsSchemaApp.controller:IdEditorCtrl
 # @description
 # Edit schedule ids as entities. Inspired by StackExchanges' tag
 # editor.
###
angular.module 'jacobsSchemaApp'
  .controller 'IdEditorCtrl', ->
    @ids = ['tjo', 'jfu']

    @removeId = (id) ->
      @ids.splice(@ids.indexOf(id), 1)

    return

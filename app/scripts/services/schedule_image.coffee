'use strict'

###*
 # @ngdoc service
 # @name jacobsSchemaApp.scheduleImage
 # @description
 # Return url to schedule image from options object.
 # Example url: http://www.novasoftware.se/ImgGen/schedulegenerator.aspx?format=png&schoolid=29120/sv-se&type=-1&id=na14a&period=&week=16&mode=0&printer=0&colors=32&head=0&clock=0&foot=0&day=0&width=1405&height=698&maxwidth=1405&maxheight=698
###
angular.module 'jacobsSchemaApp'
  .service 'scheduleImage', ->
    @webServicePath = 'http://www.novasoftware.se/ImgGen/schedulegenerator.aspx'
    @defaultOptions =
      format: 'png'
      schoolid: '29120/sv-se' # globala
      type: '-1'
      mode: '0'
      period: ''
      printer: '0'
      colors: '32'
      head: '0'
      clock: '0'
      foot: '0'
      day: '0'

    @_parameters = (options) ->
      o = Object.assign @defaultOptions, options
      ("#{k}=#{v}" for k, v of o).join '&'

    @isValidOptions = (options) ->
      required = ['id', 'week', 'width', 'height']
      required.every (key) ->
        options.hasOwnProperty key

    @getUrl = (options) ->
      if @isValidOptions options
        "#{@webServicePath}?" + @_parameters(options)
      else
        ''

    return

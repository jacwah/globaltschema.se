module.exports = (config) ->
  config.set({
    # enable / disable watching file and executing tests whenever any file changes
    autoWatch: true

    # base path, that will be used to resolve files and exclude
    basePath: '../'

    # testing framework to use (jasmine/mocha/qunit/...)
    # as well as any additional frameworks (requirejs/chai/sinon/...)
    frameworks: [
      'jasmine'
    ]

    # list of files / patterns to load in the browser
    files: [
      'app/scripts/polyfill.js'
      # bower:js
      'bower_components/jquery/dist/jquery.js'
      'bower_components/angular/angular.js'
      'bower_components/bootstrap/dist/js/bootstrap.js'
      'bower_components/angular-messages/angular-messages.js'
      'bower_components/angular-route/angular-route.js'
      'bower_components/angular-touch/angular-touch.js'
      'bower_components/moment/moment.js'
      'bower_components/ng-caret-aware/dist/caretaware.min.js'
      'bower_components/eonasdan-bootstrap-datetimepicker/build/js/bootstrap-datetimepicker.min.js'
      'bower_components/angular-local-storage/dist/angular-local-storage.js'
      'bower_components/underscore/underscore.js'
      'bower_components/angular-mocks/angular-mocks.js'
      # endbower
      'bower_components/moment/locale/sv.js'
      # bower:coffee
      'app/scripts/**/*.coffee'
      'test/mock/**/*.coffee'
      'test/spec/**/*.coffee'
    ]

    # list of files / patterns to exclude
    exclude: []

    # web server port
    port: 8080

    # Start these browsers, currently available:
    # - Chrome
    # - ChromeCanary
    # - Firefox
    # - Opera
    # - Safari (only Mac)
    # - PhantomJS
    # - IE (only Windows)
    browsers: [
      'PhantomJS'
    ]

    # Which plugins to enable
    plugins: [
      'karma-phantomjs-launcher'
      'karma-jasmine'
      'karma-coffee-preprocessor'
    ]

    preprocessors:
      '**/*.coffee': ['coffee']

    coffeePreprocessor:
      # options passed to the coffee compiler
      options: 
        bare: true
        sourceMap: false
      # transforming the filenames
      transformPath: (path) ->
        path.replace(/\.coffee$/, '.js')

    # Continuous Integration mode
    # if true, it capture browsers, run tests and exit
    singleRun: true

    colors: true

    # level of logging
    # possible values: LOG_DISABLE || LOG_ERROR || LOG_WARN || LOG_INFO || LOG_DEBUG
    logLevel: config.LOG_INFO

    # Uncomment the following lines if you are using grunt's server to run the tests
    # proxies: {
    #   '/': 'http://localhost:9000/'
    # },
    # URL root prevent conflicts with the site root
    # urlRoot: '_karma_'
  })

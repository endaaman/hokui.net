module.exports = (config) ->
    bowerFiles = require 'main-bower-files'

    files = [
        'client/core/*.coffee'
        'client/core/**/*.coffee'
        'test/unit/helper_*.coffee'
        'test/unit/**/*.coffee'
    ]
    files = bowerFiles(includeDev: true).concat files

    autoWatch = false

    config.set

        basePath: ''

        frameworks: ['jasmine']

        files: files

        exclude: []

        preprocessors:
            'client/core/**/*.coffee': ['coverage']
            'test/unit/**/*.coffee': ['coffee']

        reporters: ['progress', 'coverage']

        port: 9876

        colors: true

        logLevel: config.LOG_INFO

        autoWatch: autoWatch

        browsers: ['PhantomJS']

        singleRun: not autoWatch

        coverageReporter:
            dir : 'coverage/'
            reporters: [
                type: 'html'
            ,
                type: 'lcov'
            ]




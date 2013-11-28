require.config
    paths:
        underscore: "vendor/underscore-min"
        backbone: "vendor/backbone-min"
        jquery: "vendor/jquery-2.0.3.min"
    shim:
        underscore:
            exports: '_'
        backbone:
            deps: ['underscore', 'jquery'],
            exports: 'Backbone'
        jquery:
            exports: 'jQuery'

require ['game/loader']

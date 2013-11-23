require.config
    paths:
        "underscore": "vendor/underscore-min"
    shim:
        underscore:
            exports: '_'

require ['game/loader'], (loader) ->
    loader()

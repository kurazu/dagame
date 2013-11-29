define ['underscore'], (_) ->
    'use strict'

    class ItemView
        default_options: {}
        constructor: (options) ->
            _.extend @, @default_options, options
        draw: (ctx, model) ->


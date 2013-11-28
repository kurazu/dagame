define ['underscore'], (_) ->
    class ItemView
        default_options: {}
        constructor: (options) ->
            _.extend @, @default_options, options
        draw: (ctx, model) ->


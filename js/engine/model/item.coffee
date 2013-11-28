define ['underscore'], (_) ->
    class ItemModel
        default_options:
            x: 0
            y: 0
            width: 1
            height: 1
        constructor: (options) ->
            _.extend @, @default_options, options

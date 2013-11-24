define ['underscore'], (_) ->
    class World
        constructor: (@gravity=10) ->
            @items = []
        add: (item) ->
            item.on 'fellout', () =>
                _.defer @remove.bind @, item
            @items.push item
        remove: (item) ->
            @items = _.without @items, item
            return item

define [], () ->
    class World
        constructor: (@gravity=10) ->
            @items = []
        add: (item) ->
            @items.push item
        remove: (item) ->
            for seq_item, idx in @items
                if seq_item == item
                    @items.pop idx
                    return
            throw new Error "Item not found", item

define [], () ->
    class World
        constructor: (@gravity=10) ->
            @items = []
        add: (item) ->
            console.log 'World add item', item
            item.on 'fellout', @remove.bind @, item
            @items.push item
        remove: (item) ->
            for seq_item, idx in @items
                if seq_item == item
                    @items.pop idx
                    console.log 'World remove item', item
                    return
            throw new Error "Item not found", item

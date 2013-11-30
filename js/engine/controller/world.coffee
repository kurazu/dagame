define ['engine/view/world', 'engine/model/world', 'engine/utils/ajax',
        'engine/controller/box', 'engine/controller/player', 'engine/utils/events'], (WorldView, WorldModel, ajax, BoxController, PlayerController, Events) ->
    'use strict'

    class WorldController extends Events
        constructor: (canvas, @keyboard) ->
            @items = []
            @model = new WorldModel
            @view = new WorldView canvas
        addItem: (item) ->
            @items.push item
            return
        animate: (fraction) ->
            @move fraction
            @draw()
            return
        move: (fraction) ->
            world_model = @model
            items = @items

            moved = []
            unmoved = []

            for item in items
                new_position = item.animate fraction, world_model
                if new_position
                    moved.push [item, new_position]
                else
                    unmoved.push item

            for [item, new_position] in moved
                collides = false
                for fixed in unmoved
                    collides = item.checkCollision new_position, fixed
                    if collides
                        break
                if not collides
                    item.model.setPosition new_position
            return
        draw: () ->
            view = @view
            view.preDraw()
            for item in @items
                view.drawItem item.view, item.model
            view.postDraw()
            return
        load: (world, level) ->
            self = @
            json_path = "data/level-#{world}-#{level}.json"
            map_path = "data/level-#{world}-#{level}.map"
            ajax.getJSON json_path, (metadata) ->
                {width, height, mapping} = metadata

                load_item = (col_idx, line_idx, symbol) ->
                    description = mapping[symbol]
                    model_options =
                        x: col_idx + 0.5
                        y: height - line_idx - 0.5
                    view_options =
                        lineColor: description.stroke
                        bgColor: description.fill
                    if description.type == "fixed"
                        item = new BoxController model_options, view_options
                    else if description.type == "player"
                        item = new PlayerController self.keyboard, model_options, view_options
                    else
                        throw "Unknown type #{description.type}"
                    console.log "Adding", item
                    self.addItem item


                ajax.get map_path, (map) ->
                    lines = map.split '\n'
                    for line_idx in [0...height]
                        line = lines[line_idx]
                        for col_idx in [0...width]
                            cell = line[col_idx]
                            load_item col_idx, line_idx, cell if cell and cell != ' '
                    self.trigger 'loaded'
                    return





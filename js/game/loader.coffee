define ['engine/loop', 'engine/keyboard', 'engine/model/item', 'engine/controller/world'], (Loop, Keyboard, Item, WorldController) ->
    () ->
        canvas = document.querySelector '#game'
        world = new WorldController canvas

        item = new Item
            x: 1, y: 80, width: 1, height: 1
        world.model.add item
        item = new Item
            x: 1, y: 30, width: 1, height: 1
        world.model.add item

        keyboard = new Keyboard
        keyboard.bind()

        loop_callback = (diff) ->
            world.animate diff

        game_loop = new Loop loop_callback
        game_loop.start()

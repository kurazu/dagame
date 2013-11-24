define ['engine/loop', 'engine/keyboard', 'engine/model/item',
        'engine/controller/world', 'engine/math/vector', 'engine/view/camera'], (Loop, Keyboard, Item, WorldController, Vector, Camera) ->
    () ->
        canvas = document.querySelector '#game'
        world = new WorldController canvas
        camera = new Camera -10, 100, 100, 0
        world.view.setCamera camera

        item = new Item
            x: 1, y: 80, width: 1, height: 1, id: 'bullet'
        item.applyMomentum new Vector 1, 0
        world.model.add item
        item = new Item
            x: 1, y: 30, width: 1, height: 1, id: 'canon'
        item.applyMomentum new Vector 0.4, 0.4
        world.model.add item

        keyboard = new Keyboard
        keyboard.bind()

        loop_callback = (diff) ->
            world.animate diff

        game_loop = new Loop loop_callback
        game_loop.start()

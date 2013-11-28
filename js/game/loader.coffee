define ['engine/loop', 'engine/controller/world', 'engine/controller/box'], (Loop, WorldController, BoxController) ->
    () ->
        canvas = document.querySelector '#game'
        world = new WorldController canvas

        #camera = new Camera -10, 100, 100, 0
        #world.view.setCamera camera

        item = new BoxController
            x: 0.5
            y: 0.5
        world.addItem item

        loop_callback = (diff) ->
            world.animate diff

        game_loop = new Loop loop_callback
        game_loop.start()

define ['engine/utils/loop', 'engine/controller/world', 'engine/controller/box',
        'engine/utils/keyboard', 'engine/controller/player'], (Loop, WorldController, BoxController, Keyboard, PlayerController) ->

    canvas = document.querySelector '#game'
    world = new WorldController canvas

    keyboard = new Keyboard
    keyboard.bind()

    #camera = new Camera -10, 100, 100, 0
    #world.view.setCamera camera

    item = new BoxController
        x: 0.5
        y: 0.5
    world.addItem item

    item = new BoxController
        x: 1.5
        y: 1.5
    world.addItem item

    item = new BoxController
        x: 2.5
        y: 2.5
    world.addItem item

    item = new BoxController
        x: 3.5
        y: 3.5
    world.addItem item

    item = new BoxController
        x: 4.5
        y: 4.5
    world.addItem item

    item = new BoxController
        x: 2.5
        y: 1.5
    #world.addItem item

    player = new PlayerController keyboard,
        x: 0.5
        y: 1.5
    #world.addItem player

    loop_callback = (diff) ->
        world.animate diff

    game_loop = new Loop loop_callback
    game_loop.start()

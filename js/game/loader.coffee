define ['engine/utils/loop', 'engine/controller/world', 'engine/controller/box',
        'engine/utils/keyboard', 'engine/controller/player',
        'engine/math/vector', 'engine/controller/projectile'], (Loop, WorldController, BoxController, Keyboard, PlayerController, Vector, ProjectileController) ->
    'use strict'

    canvas = document.querySelector '#game'
    keyboard = new Keyboard
    world = new WorldController canvas, keyboard

    keyboard.bind()

    world.load 1, 1

    world.on 'loaded', () ->
        game_loop.start()

    loop_callback = (diff, fractionsOfSecond) ->
        world.animate fractionsOfSecond

    game_loop = new Loop loop_callback

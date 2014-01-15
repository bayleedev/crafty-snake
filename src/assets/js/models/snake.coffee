# Controls multiple snake_piece entities.
Crafty.c "Snake",

  interval: null

  init: ->
    @requires('Model, Directional')
    @add_piece()
    @bind 'EnterFrame', @move_snake

  add_piece: (direction = [1,1]) ->
    Crafty.e('SnakePiece').at(direction[0], direction[1])

  remove_last_piece: ->
    Crafty.fn.destroy.call(Crafty(Crafty('SnakePiece')[0]))

  # Set this on a loop
  move_snake: ->
    @add_piece(@next_direction())
    @remove_last_piece()

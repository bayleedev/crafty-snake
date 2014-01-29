# Controls multiple snake_piece entities.
Crafty.c "Snake",

  interval: null

  init: ->
    @requires('Model, SnakeDirectional, GridCollision')
    @data(pieces: [], last_piece: 0)
    @bind 'EnterFrame', @move_snake
    @add_piece()

  remove: ->
    @unbind 'EnterFrame', @move_snake

  add_piece: (direction = [1,1]) ->
    new_piece = Crafty.e('SnakePiece').at(direction[0], direction[1])
    @data('pieces').push(new_piece)

  # Set this on a loop
  move_snake: ->
    piece = @data('pieces').shift()
    piece.at.apply(piece, @next_direction())
    @data('pieces').push(piece)
    @move_to_next_direction()

  hit: ->
    # delegate to grow/die

  grow: ->
    # grow snake, skip move

  die: ->
    # die, trigger die event

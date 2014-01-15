Crafty.c "Grid",
  init: ->
    board = game.board()
    @attr
      w: board.map_grid.tile.width
      h: board.map_grid.tile.height

  at: (x, y) ->
    board = game.board()
    if x? and y?
      @attr
        x: x * board.map_grid.tile.width
        y: y * board.map_grid.tile.height
      @
    else
      x: @x / board.map_grid.tile.width
      y: @y / board.map_grid.tile.height

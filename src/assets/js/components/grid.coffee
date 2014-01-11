Crafty.c "Grid",
  board: game.board()
  init: ->
    @attr
      w: @board.map_grid.tile.width
      h: @board.map_grid.tile.height

  at: (x, y) ->
    if x? and y?
      @attr
        x: x * @board.map_grid.tile.width
        y: y * @board.map_grid.tile.height
      @
    else
      x: @x / @board.map_grid.tile.width
      y: @y / @board.map_grid.tile.height

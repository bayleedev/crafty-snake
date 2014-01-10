Crafty.c "Grid",
  init: ->
    @attr
      w: Game.map_grid.tile.width
      h: Game.map_grid.tile.height


  at: (x, y) ->
    if x? and y?
      @attr
        x: x * Game.map_grid.tile.width
        y: y * Game.map_grid.tile.height
      @
    else
      x: @x / Game.map_grid.tile.width
      y: @y / Game.map_grid.tile.height

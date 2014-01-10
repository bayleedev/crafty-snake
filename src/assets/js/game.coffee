window.Game =
  map_grid:
    width: 40
    height: 40
    tile:
      width: 16
      height: 16

  width: ->
    @map_grid.width * @map_grid.tile.width

  height: ->
    @map_grid.height * @map_grid.tile.height

  start: ->
    Crafty.init Game.width(), Game.height()
    Crafty.background "Silver"
    Crafty.scene "Start"

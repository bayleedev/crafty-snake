game.models.Board = Backbone.Model.extend

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

  last_bottom_block: ->
    @map_grid.height - 1

  last_right_block: ->
    @map_grid.width - 1

  taken: (x, y) ->
    for item in Crafty('Solid Grid')
      at = Crafty(item).at()
      return true if at.x is x and at.y is y
    false


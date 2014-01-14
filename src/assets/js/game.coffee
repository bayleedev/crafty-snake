class Game
  models: {}

  board: ->
    @_board ||= Crafty.m('Board')

  start: =>
    Crafty.init @board().width(), @board().height()
    Crafty.background "Silver"
    Crafty.scene "Start"

window.game = new Game

Crafty.scene "Start", ->

  Crafty.e("Borders")

  Crafty.e("Title").at(0, 5).text "Crafty Snake"

  Crafty.e("Subtitle").at(0, 10).text "Press any key to continue"

  Crafty.e("Subtitle").at(0, 12).text "H, J, K, L"

  Crafty.e("Keyboard").one 'KeyDown', ->
    Crafty.scene 'Game'

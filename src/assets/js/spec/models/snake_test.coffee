subject = undefined

describe 'Snake', ->

  beforeEach (done) ->
    Crafty('Grid').each ->
      @destroy()
    game.start()
    done()

  describe '#add_piece', ->

    beforeEach (done) ->
      expect(Crafty('Snake').length).to.equal(0)
      subject = Crafty.e('Snake')
      done()

    it 'creates new piece', ->
      expect(Crafty('Snake').length).to.equal(1)

  describe '#move_snake', ->

    describe 'given I am facing down', ->

      beforeEach (done) ->
        subject = Crafty.e('Snake')
        subject.data(direction: subject.DOWN)
        subject.move_snake()
        done()

      it 'moves it down', ->
        expect(subject.data('pieces')[0].at()).to.deep.equal(x: 1, y: 2)

  describe '#change_direction', ->

    beforeEach (done) ->
      subject = Crafty.e('Snake')
      expect(subject.data('direction')).to.equal(subject.RIGHT)
      subject.change_direction(key: Crafty.keys.H)
      done()

    it 'should be facing down', ->
      expect(subject.data('direction')).to.equal(subject.LEFT)

# TODO: Refactor this model to use an internal Game Model instead
# of containing the game logic directly.
class window.App extends Backbone.Model
  initialize: ->
    @set 'totalScore', 0
    @set 'currentGame', game = new Game()
    @get 'currentGame'
      .on 
        'ended' : @resetGame
      , @

  resetGame: ->
    @set 'currentGame', game = new Game()
    console.log 'new game'


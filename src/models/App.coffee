# TODO: Refactor this model to use an internal Game Model instead
# of containing the game logic directly.
class window.App extends Backbone.Model
  initialize: ->
    @set 'totalWinnings', 100
  #   @set 'currentGame', game = new Game()
  #   @get 'currentGame'
  #     .on 
  #       'ended' : @resetGame
  #     , @

  startGame: (bet)->
    @set 'bet' , bet
    if @get 'totalWinnings' <= 0 then alert 'You are broke'
    else 
      @set 'currentGame', game = new Game()
      @get 'currentGame'
        .on 
          'ended' : @endGame
        , @

  endGame: (outcome)->
    bet = @get 'bet'
    @updateWinnings(outcome, bet)
    @trigger 'reset'


  updateWinnings: (outcome, bet)->
    switch outcome
      when 'Dealer' then @set 'totalWinnings' , (@get 'totalWinnings') - bet
      when 'Player' then @set 'totalWinnings' , (@get 'totalWinnings') + bet
    console.log bet
    console.log @get 'totalWinnings'

  



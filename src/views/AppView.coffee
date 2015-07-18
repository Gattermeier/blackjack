class window.AppView extends Backbone.View
  template: _.template '    
    <div class="scoreboard"></div>
    <div class="bet"></div>
    <input type="text" id="betting"><button type="button" id="startgame">Start Game</button>
    <div class="gameboard"></div>
  '
  initialize: ->
    @renderBasics()
    @model.on 'change:currentGame', => @renderGame()
    @model.on 'reset', => @renderBasics()

  renderBasics: ->
    @$el.children().detach()
    @$el.html @template()
    @$el.find('.scoreboard').html @model.get 'totalWinnings'
    
  renderGame: ->
    @$el.children().detach()
    @$el.html @template()
    @$el.find('.scoreboard').html @model.get 'totalWinnings'
    @$el.find('.bet').text @model.get 'bet'
    @$el.find('.gameboard').html new GameView({model: @model.get('currentGame')}).el

  events: {
    'click #startgame' : 'startGame'
  }

  startGame: ->
    bet = Number($('#betting').val())
    currentWinnings = @model.get 'totalWinnings'
    console.log 'bet: ' + bet
    console.log 'typeof bet: ' + typeof bet
    if bet > 0 and bet <= currentWinnings 
      @model.startGame(bet)
    else alert 'You need to make a valid bet'
  
  # template: _.template '
  #   <button class="hit-button">Hit</button> <button class="stand-button">Stand</button>
  #   <div class="player-hand-container"></div>
  #   <div class="dealer-hand-container"></div>
  # '

  # events:
  #   'click .hit-button': -> @model.get('playerHand').hit()
  #   'click .stand-button': -> @model.get('playerHand').stand()

  # initialize: ->
  #   @render()

  # render: ->
  #   @$el.children().detach()
  #   @$el.html @template()
  #   @$('.player-hand-container').html new HandView(collection: @model.get 'playerHand').el
  #   @$('.dealer-hand-container').html new HandView(collection: @model.get 'dealerHand').el


class window.AppView extends Backbone.View
  template: _.template '    
    <div class="scoreboard"></div>
    <div class="gameboard"></div>
  '

  initialize: ->
    @render()
    @model.on 'change', => @render()

  render: ->
    @$el.children().detach()
    @$el.html @template()
    @$el.find('.scoreboard').html '4'
    @$el.find('.gameboard').html new GameView({model: @model.get('currentGame')}).el   
  
  
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


require! {
  'game/scene/WebglLayer'
  'game/scene/TiledSpriteContainer'
}

const blur-amount = 50px
  blur-passes = 13

module.exports = class BackgroundLayer extends WebglLayer
  initialize: (options) ->
    super options
    @name = options.name
    @container = new TiledSpriteContainer "/content/bg-tiles/#{@name}", @width, @height
    @blurable-container = new TiledSpriteContainer "/content/bg-tiles/#{@name}", @width, @height

  load: ->
    @container.load!
      .then ~> @blurable-container.load!
      .then ~> @setup!

  setup: ->
    @add @blurable-container, 2, true
    @add @container, 2, true
    @container.visible = false

  render: ->
    super!

  focus: (rect, duration) ->
    @_focus-mask = new PIXI.Graphics!
      ..begin-fill 0xFF00FF
      ..draw-rect rect.left, rect.top, rect.width, rect.height
      ..end-fill!

    @stage.add-child @_focus-mask
    @container.mask = @_focus-mask
    @container.visible = true

    @_blur-filter = new PIXI.filters.BlurFilter!
      ..blur = 0
      ..passes = blur-passes
    @blurable-container.filters = [@_blur-filter]
    @render!
    @animate duration, (amt) ~> @_blur-filter.blur = blur-amount * amt

  unfocus: (duration) ->
    @animate duration, (amt) ~> @_blur-filter.blur = blur-amount * (1 - amt)
      .then ~>
        @container.mask = null
        @container.visible = false
        @stage.remove-child @_focus-mask
        @_focus-mask = null
        @blurable-container.filters = null
        @_blur-filter = null
        @render!

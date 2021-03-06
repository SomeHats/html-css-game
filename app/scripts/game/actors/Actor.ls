module.exports = class Actor extends Backbone.View
  @from-el = ($el, args, offset, store, area-view) -> new this {el: $el.0, args, offset, store, area-view}

  mapper-ignore: true

  initialize: (start = {x: 0, y: 0}) ->
    @subs = []
    @start = start
    @args = start.args if start.args
    @store = start.store if start.store
    @area-view = start.area-view if start.area-view
    @area-level = start.area-level if start.area-level
    @origin = start.{x, y}
    @offset = start.offset or {x: 0, y: 0}
    @store = start.store
    width = @$el.width!
    height = @$el.height!

    if @mapper-ignore then @$el.attr \data-ignore true
    @$el.css {
      position: \absolute
      left: start.x - width / 2
      top: start.y - height / 2
    }

    @$el.data 'actor' this
    @$el.add-class "actor-#{@actor-type!}"

    # Data for physics
    this <<< {
      type: \rect
      x: start.x
      y: start.y
      width: width
      height: height
      rotation: 0
      data: {}
    } <<< (@physics or {})

    @data.id = "ENTITY_#{@actor-type!to-upper-case!}"
    @data.actor = @actor = true

  load: -> Promise.resolve!

  actor-type: -> Object.get-prototype-of this .constructor.display-name.to-lower-case!
  is-dynamic: -> @data.dynamic

  set-origin: (x, y) ->
    last-origin = @origin.{x, y}
    @origin <<< {x, y}
    @trigger 'set:origin', @origin, @last-origin

  reset: (origin = @origin) ->
    @ <<< {
      x: origin.x
      y: origin.y
      rotation: 0
      prepared: false
      last-fall-dist: 0
      fall-dist: 0
    }

    # Stop the actor from continuing to track moving platforms after it has reset
    @fixed-to = null

    @$el.css {
      left: origin.x - @width/2
      top: origin.y - @height/2
    }

    @prepare true

  remove: ->
    super!
    for sub in @subs => sub.unsubscribe!

  draw: ->
    @$el.css prefixed.transform, "translate3d(#{@p.x - @x - @offset.x}px, #{@p.y - @y - @offset.y}px, 0)"

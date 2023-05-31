class Grid

    constructor: ->

        @active = null

        @axes = new Axes()
        @caps = new Caps()
        @ticks = new Ticks()

    add: (save = false) ->

        if not this.active

            this.active = true

            this.axes.add save
            this.caps.add save
            this.ticks.add save

    remove: (save = false) ->

        if this.active

            this.active = false

            this.axes.remove save
            this.caps.remove save
            this.ticks.remove save

    reset: ->

        this.axes.reset()
        this.caps.reset()
        this.ticks.reset()

    refresh: ->

        this.remove()
        this.add()

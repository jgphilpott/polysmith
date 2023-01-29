class Grid

    constructor: ->

        @active = null

        @axes = new Axes()
        @caps = new Caps()
        @ticks = new Ticks()

    add: ->

        if not this.active

            this.active = true

            this.axes.add()
            this.caps.add()
            this.ticks.add()

    remove: ->

        if this.active

            this.active = false

            this.axes.remove()
            this.caps.remove()
            this.ticks.remove()

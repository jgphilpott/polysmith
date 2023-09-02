class ZoomControls

    constructor: ->

        @active = null

        @min = settings.get "controls.zoom.min"
        @max = settings.get "controls.zoom.max"

        @speed = settings.get "controls.speed.zoom"

    getMin: ->

        return adaptor "convert", "length", clone this.min

    setMin: (min, save = true) ->

        this.min = adaptor "invert", "length", Number min

        if save then settings.set "controls.zoom.min", this.min

    getMax: ->

        return adaptor "convert", "length", clone this.max

    setMax: (max, save = true) ->

        this.max = adaptor "invert", "length", Number max

        if save then settings.set "controls.zoom.max", this.max

    getSpeed: ->

        return clone this.speed

    setSpeed: (speed, save = true) ->

        this.speed = Number speed

        panels.camera.setZoomSpeed this.speed

        if save then settings.set "controls.speed.zoom", this.speed

    add: ->

        if not this.active

            this.active = true

            zoomTimeout = null
            zoomModifier = 100000

            $("#canvas").on "wheel", (event) =>

                event.preventDefault()
                event.stopPropagation()

                clearTimeout zoomTimeout

                target = camera.getTarget()
                position = camera.getPosition()
                distance = position.distanceTo target

                zoomDelta = event.originalEvent.wheelDelta * this.getSpeed() / zoomModifier

                zoomOut = zoomDelta < 0 and distance <= this.getMax()
                zoomIn = zoomDelta > 0 and distance >= this.getMin()

                updateCamera = (save = true) ->

                    camera.zooming = not save

                    camera.setPosition position, save

                zoomTimeout = setTimeout updateCamera, 100

                zoom = ->

                    position.x -= stepX * zoomDelta
                    position.y -= stepY * zoomDelta
                    position.z -= stepZ * zoomDelta

                    updateCamera false

                stepX = position.x - target.x
                stepY = position.y - target.y
                stepZ = position.z - target.z

                if zoomOut or zoomIn

                    zoom()

    remove: ->

        if this.active

            this.active = false

            $("#canvas").off "wheel"

    reset: ->

        defaults = settings.controls.defaults()

        this.setMin adaptor "convert", "length", defaults.zoom.min
        this.setMax adaptor "convert", "length", defaults.zoom.max

        this.setSpeed defaults.speed.zoom

class ZoomControls

    constructor: ->

        @active = null

    add: ->

        if not this.active

            this.active = true

            zoomTimeout = null
            zoomModifier = 100000

            $("#canvas").on "wheel", (event) ->

                event.preventDefault()
                event.stopPropagation()

                clearTimeout zoomTimeout

                target = clone camera.getTarget()
                position = clone camera.getPosition()

                distance = camera.getPosition().distanceTo target

                zoomMax = settings.getSetting "controls", "zoomMax"
                zoomMin = settings.getSetting "controls", "zoomMin"

                zoomSpeed = settings.getSetting "controls", "zoomSpeed"
                zoomDelta = event.originalEvent.wheelDelta * zoomSpeed / zoomModifier

                zoomOut = zoomDelta < 0 and distance <= zoomMax
                zoomIn = zoomDelta > 0 and distance >= zoomMin

                stepX = position.x - target.x
                stepY = position.y - target.y
                stepZ = position.z - target.z

                updateCamera = (save = true) ->

                    camera.setPosition position, save

                zoomTimeout = setTimeout updateCamera, 100

                zoom = ->

                    position.x -= stepX * zoomDelta
                    position.y -= stepY * zoomDelta
                    position.z -= stepZ * zoomDelta

                    updateCamera false

                if zoomOut or zoomIn

                    zoom()

    remove: ->

        if this.active

            this.active = false

            $("#canvas").off "wheel"

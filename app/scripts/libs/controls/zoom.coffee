addZoomControls = () ->

    zoomTimeout = null

    $("#canvas").on "wheel", (event) ->

        event.preventDefault()
        event.stopPropagation()

        clearTimeout(zoomTimeout)

        panel = $ "#camera.panel"

        target = camera.target
        position = camera.position

        stepX = position.x - target.x
        stepY = position.y - target.y
        stepZ = position.z - target.z

        zoomMax = settings.controls.zoomMax
        zoomMin = settings.controls.zoomMin
        zoomSpeed = settings.controls.zoomSpeed / 50000
        zoomDelta = event.originalEvent.wheelDelta * zoomSpeed

        zoom = () ->

            position.x -= stepX * zoomDelta
            position.y -= stepY * zoomDelta
            position.z -= stepZ * zoomDelta

            panel.find("#position-x input").val position.x.toFixed 2
            panel.find("#position-y input").val position.y.toFixed 2
            panel.find("#position-z input").val position.z.toFixed 2

            if tooltips.getSelected() then tooltips.updateRotationTools()

        if zoomDelta > 0 and position.distanceTo(target) >= zoomMin # Zoom In

            zoom()

        else if zoomDelta < 0 and position.distanceTo(target) <= zoomMax # Zoom Out

            zoom()

        zoomTimeout = setTimeout(() ->

            updateSettings "camera", "position", position

        , 100)

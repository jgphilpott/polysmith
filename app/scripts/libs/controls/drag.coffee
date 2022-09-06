addDragControls = () ->

    radius3 = null

    startX = null
    startY = null

    target = null
    position = null
    dragSpeed = null

    verticalAngle = null
    horizontalAngle = null

    start = (event) ->

        camera.dragged = null

        event.preventDefault()
        event.stopPropagation()

        startX = event.pageX
        startY = event.pageY

        target = camera.target
        position = camera.position

        dragSpeed = settings.controls.dragSpeed / 500

        deltaX = Math.abs position.x - target.x
        deltaZ = Math.abs position.z - target.z

        radius3 = position.distanceTo target
        radius2 = side$sides deltaZ, null, radius3

        horizontalAngle = angle$sides radius2, deltaX

        if position.x < target.x

            horizontalAngle = 180 - horizontalAngle

        if position.y < target.y

            horizontalAngle = - horizontalAngle

        verticalAngle = angle$sides radius3, deltaZ

        if position.z < target.z

            verticalAngle = 180 - verticalAngle

        document.onmousemove = drag
        document.onmouseup = stop

    drag = (event) ->

        camera.dragged = true

        event.preventDefault()
        event.stopPropagation()

        satoshi = 0.000001
        panel = $ "#camera.panel"

        radius2 = side$sides Math.abs(position.z - target.z), null, radius3

        newHorizontalAngle = horizontalAngle + ((startX - event.pageX) * dragSpeed)

        if newHorizontalAngle >= 180

            newHorizontalAngle = newHorizontalAngle - 360

        newVerticalAngle = verticalAngle + ((startY - event.pageY) * dragSpeed)

        if newVerticalAngle <= 0

            newVerticalAngle = satoshi

        else if newVerticalAngle >= 180

            newVerticalAngle = - 180 - satoshi

        newX = side$angle(newHorizontalAngle, radius2, true, null) + target.x
        newY = side$angle(newHorizontalAngle, radius2, null, true) + target.y
        newZ = side$angle(newVerticalAngle, radius3, true, null) + target.z

        panel.find("#position-x input").val newX.toFixed 2
        panel.find("#position-y input").val newY.toFixed 2
        panel.find("#position-z input").val newZ.toFixed 2

        position.set newX, newY, newZ
        camera.lookAt target.x, target.y, target.z

    stop = (event) ->

        event.preventDefault()
        event.stopPropagation()

        document.onmouseup = null
        document.onmousemove = null

        updateSettings "camera", "position", position

    $("#canvas").mousedown start

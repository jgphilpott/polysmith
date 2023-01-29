class DragControls

    constructor: ->

        @active = null

    add: ->

        if not this.active

            this.active = true

            radius3 = null
            radius2 = null

            startX = null
            startY = null

            target = null
            position = null

            dragSpeed = null
            dragModifier = 1000

            verticalAngle = null
            horizontalAngle = null

            start = (event) ->

                startX = event.pageX
                startY = event.pageY

                camera.setDragged null

                event.preventDefault()
                event.stopPropagation()

                target = camera.getTarget()
                position = camera.getPosition()

                deltaX = Math.abs position.x - target.x
                deltaZ = Math.abs position.z - target.z

                radius3 = position.distanceTo target
                radius2 = side$sides deltaZ, null, radius3

                verticalAngle = angle$sides radius3, deltaZ
                horizontalAngle = angle$sides radius2, deltaX

                if position.x < target.x then horizontalAngle = 180 - horizontalAngle
                if position.y < target.y then horizontalAngle = - horizontalAngle
                if position.z < target.z then verticalAngle = 180 - verticalAngle

                dragSpeed = settings.getSetting "controls", "dragSpeed"
                dragSpeed = dragSpeed / dragModifier

                document.onmousemove = drag
                document.onmouseup = stop

            drag = (event) ->

                satoshi = 0.000001

                camera.setDragged true

                event.preventDefault()
                event.stopPropagation()

                deltaZ = Math.abs position.z - target.z
                radius2 = side$sides deltaZ, null, radius3

                newVerticalAngle = verticalAngle + ((startY - event.pageY) * dragSpeed)
                newHorizontalAngle = horizontalAngle + ((startX - event.pageX) * dragSpeed)

                if newVerticalAngle <= 0 then newVerticalAngle = satoshi
                else if newVerticalAngle >= 180 then newVerticalAngle = - 180 - satoshi
                if newHorizontalAngle >= 180 then newHorizontalAngle = newHorizontalAngle - 360

                newX = side$angle(newHorizontalAngle, radius2, true, null) + target.x
                newY = side$angle(newHorizontalAngle, radius2, null, true) + target.y
                newZ = side$angle(newVerticalAngle, radius3, true, null) + target.z

                camera.setPosition x: newX, y: newY, z: newZ, false

            stop = (event) ->

                event.preventDefault()
                event.stopPropagation()

                document.onmouseup = null
                document.onmousemove = null

                camera.setPosition camera.getPosition()

            $("#canvas").mousedown start

    remove: ->

        if this.active

            this.active = false

            $("#canvas").off "mousedown"

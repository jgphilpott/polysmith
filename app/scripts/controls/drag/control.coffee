class DragControls

    constructor: ->

        @active = null

        @speed = settings.get "controls.speed.drag"

    getSpeed: ->

        return clone this.speed

    setSpeed: (speed, animate = true, save = true) ->

        this.speed = Number speed

        panels.camera.setDragSpeed this.speed, animate

        if save then settings.set "controls.speed.drag", this.speed

    add: ->

        if not this.active

            this.active = true

            startX = null
            startY = null

            radius3 = null
            radius2 = null

            target = null
            position = null

            dragSpeed = null
            dragModifier = 500

            verticalAngle = null
            horizontalAngle = null

            start = (event) =>

                startX = event.pageX
                startY = event.pageY

                camera.dragged = null
                camera.dragging = null

                event.preventDefault()
                event.stopPropagation()

                target = camera.target
                position = camera.position

                deltaX = Math.abs position.x - target.x
                deltaZ = Math.abs position.z - target.z

                radius3 = position.distanceTo target
                radius2 = side$sides deltaZ, null, radius3

                verticalAngle = angle$sides radius3, deltaZ
                horizontalAngle = angle$sides radius2, deltaX

                if position.x < target.x then horizontalAngle = 180 - horizontalAngle
                if position.y < target.y then horizontalAngle = -horizontalAngle
                if position.z < target.z then verticalAngle = 180 - verticalAngle

                dragSpeed = this.getSpeed() / dragModifier

                document.onmousemove = drag
                document.onmouseup = stop

            drag = (event) =>

                camera.dragged = true
                camera.dragging = true

                event.preventDefault()
                event.stopPropagation()

                deltaZ = Math.abs position.z - target.z
                radius2 = side$sides deltaZ, null, radius3

                newVerticalAngle = verticalAngle + ((startY - event.pageY) * dragSpeed)
                newHorizontalAngle = horizontalAngle + ((startX - event.pageX) * dragSpeed)

                if newVerticalAngle <= 0 then newVerticalAngle = satoshi
                else if newVerticalAngle >= 180 then newVerticalAngle = satoshi - 180
                if newHorizontalAngle >= 180 then newHorizontalAngle = newHorizontalAngle - 360

                newX = side$angle(newHorizontalAngle, radius2, true, null) + target.x
                newY = side$angle(newHorizontalAngle, radius2, null, true) + target.y
                newZ = side$angle(newVerticalAngle, radius3, true, null) + target.z

                newPosition =

                    x: adaptor "convert", "length", newX
                    y: adaptor "convert", "length", newY
                    z: adaptor "convert", "length", newZ

                camera.setPosition newPosition, false

            stop = (event) =>

                event.preventDefault()
                event.stopPropagation()

                camera.dragging = false

                document.onmouseup = null
                document.onmousemove = null

                camera.setPosition camera.getPosition()

            $("#canvas").mousedown start

    remove: ->

        if this.active

            this.active = false

            $("#canvas").off "mousedown"

    reset: ->

        defaults = settings.controls.defaults()

        this.setSpeed defaults.speed.drag

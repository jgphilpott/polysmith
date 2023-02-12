class FlyControls

    constructor: ->

        @active = null

    add: ->

        if not this.active

            this.active = true

            $(document).keydown (event) ->

                if [37, 38, 39, 40, 65, 68, 83, 87].includes event.keyCode

                    flyModifier = 10
                    satoshi = 0.000001

                    target = clone camera.getTarget()
                    position = clone camera.getPosition()

                    deltaX = Math.abs position.x - target.x
                    deltaZ = Math.abs position.z - target.z

                    radius3 = camera.getPosition().distanceTo target
                    radius2 = side$sides deltaZ, null, radius3

                    verticalAngle = angle$sides radius3, deltaZ
                    horizontalAngle = angle$sides radius2, deltaX

                    if position.x < target.x then horizontalAngle = 180 - horizontalAngle
                    if position.y < target.y then horizontalAngle = -horizontalAngle
                    if position.z < target.z then verticalAngle = 180 - verticalAngle

                    flySpeed = settings.get "controls.speed.fly"
                    flySpeed = flySpeed / flyModifier

                    if [37, 38, 39, 40].includes event.keyCode

                        if event.keyCode is 38 or event.keyCode is 40 # Up or Down

                            if verticalAngle >= 90 then verticalAngle = 180 - verticalAngle

                            stepZ = side$angle verticalAngle, flySpeed, null, true

                            if event.keyCode is 38 # Up

                                position.z += stepZ
                                target.z += stepZ

                            else if event.keyCode is 40 # Down

                                position.z -= stepZ
                                target.z -= stepZ

                        if event.keyCode is 37 or event.keyCode is 39 # Left or Right

                            horizontalAngle += 90

                            if horizontalAngle >= 180 then horizontalAngle -= 360

                            stepX = side$angle horizontalAngle, flySpeed, true, null
                            stepY = side$angle horizontalAngle, flySpeed, null, true

                            if event.keyCode is 37 # Left

                                position.x -= stepX
                                position.y -= stepY

                                target.x -= stepX
                                target.y -= stepY

                            else if event.keyCode is 39 # Right

                                position.x += stepX
                                position.y += stepY

                                target.x += stepX
                                target.y += stepY

                    if [65, 68, 83, 87].includes event.keyCode

                        if event.keyCode is 87 or event.keyCode is 83 # W or S

                            if event.keyCode is 87 then verticalAngle += flySpeed
                            if event.keyCode is 83 then verticalAngle -= flySpeed

                            if verticalAngle <= 0

                                verticalAngle = satoshi

                            else if verticalAngle >= 180

                                verticalAngle = satoshi - 180

                            target.z = position.z - side$angle verticalAngle, radius3, true, null
                            radius2 = side$sides Math.abs(position.z - target.z), null, radius3

                        else if event.keyCode is 65 or event.keyCode is 68 # A or D

                            if event.keyCode is 65 then horizontalAngle += flySpeed
                            if event.keyCode is 68 then horizontalAngle -= flySpeed

                            if horizontalAngle >= 180 then horizontalAngle -= 360

                        target.x = position.x - side$angle horizontalAngle, radius2, true, null
                        target.y = position.y - side$angle horizontalAngle, radius2, null, true

                    camera.setPosition position, false
                    camera.setTarget target, false

            $(document).keyup (event) ->

                if [37, 38, 39, 40, 65, 68, 83, 87].includes event.keyCode

                    if [37, 38, 39, 40].includes event.keyCode

                        camera.setPosition camera.getPosition()

                    camera.setTarget camera.getTarget()

    remove: ->

        if this.active

            this.active = false

            $(document).off "keydown keyup"

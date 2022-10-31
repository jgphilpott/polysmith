class FlyControls

    constructor : () ->

        @active = null

    add : () ->

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
                    if position.y < target.y then horizontalAngle = - horizontalAngle
                    if position.z < target.z then verticalAngle = 180 - verticalAngle

                    flySpeed = settings.getSetting "controls", "flySpeed"
                    flySpeed = flySpeed / flyModifier

                    if [37, 38, 39, 40].includes event.keyCode

                        if event.keyCode == 38 or event.keyCode == 40 # Up or Down

                            if verticalAngle > 90

                                verticalAngle = 180 - verticalAngle

                                inverter = 1

                            else

                                inverter = -1

                            radius2 = side$angle verticalAngle, flySpeed, true, null

                            stepX = side$angle(horizontalAngle, radius2, true, null) * inverter
                            stepY = side$angle(horizontalAngle, radius2, null, true) * inverter
                            stepZ = side$angle(verticalAngle, flySpeed, null, true)

                            if event.keyCode == 38 # Up

                                position.x += stepX
                                position.y += stepY
                                position.z += stepZ

                                target.x += stepX
                                target.y += stepY
                                target.z += stepZ

                            else if event.keyCode == 40 # Down

                                position.x -= stepX
                                position.y -= stepY
                                position.z -= stepZ

                                target.x -= stepX
                                target.y -= stepY
                                target.z -= stepZ

                        if event.keyCode == 37 or event.keyCode == 39 # Left or Right

                            horizontalAngle += 90

                            if horizontalAngle >= 180 then horizontalAngle -= 360

                            stepX = side$angle horizontalAngle, flySpeed, true, null
                            stepY = side$angle horizontalAngle, flySpeed, null, true

                            if event.keyCode == 37 # Left

                                position.x -= stepX
                                position.y -= stepY

                                target.x -= stepX
                                target.y -= stepY

                            else if event.keyCode == 39 # Right

                                position.x += stepX
                                position.y += stepY

                                target.x += stepX
                                target.y += stepY

                    if [65, 68, 83, 87].includes event.keyCode

                        if event.keyCode == 87 # W

                            verticalAngle += flySpeed

                            if verticalAngle <= 0

                                verticalAngle = satoshi

                            else if verticalAngle >= 180

                                verticalAngle = - 180 - satoshi

                            target.z = position.z - side$angle verticalAngle, radius3, true, null
                            radius2 = side$sides Math.abs(position.z - target.z), null, radius3

                            target.x = position.x - side$angle horizontalAngle, radius2, true, null
                            target.y = position.y - side$angle horizontalAngle, radius2, null, true

                        else if event.keyCode == 83 # S

                            verticalAngle -= flySpeed

                            if verticalAngle <= 0

                                verticalAngle = satoshi

                            else if verticalAngle >= 180

                                verticalAngle = - 180 - satoshi

                            target.z = position.z - side$angle verticalAngle, radius3, true, null
                            radius2 = side$sides Math.abs(position.z - target.z), null, radius3

                            target.x = position.x - side$angle horizontalAngle, radius2, true, null
                            target.y = position.y - side$angle horizontalAngle, radius2, null, true

                        else if event.keyCode == 65 # A

                            horizontalAngle += flySpeed

                            if horizontalAngle >= 180 then horizontalAngle -= 360

                            target.x = position.x - side$angle horizontalAngle, radius2, true, null
                            target.y = position.y - side$angle horizontalAngle, radius2, null, true

                        else if event.keyCode == 68 # D

                            horizontalAngle -= flySpeed

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

    remove : () ->

        if this.active

            this.active = false

            $(document).off "keydown keyup"

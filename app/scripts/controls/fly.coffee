addFlyControls = () ->

    $(document).keydown((event) ->

        if [37, 38, 39, 40, 65, 68, 83, 87].includes event.keyCode

            satoshi = 0.000001
            panel = $ "#camera.panel"

            target = camera.target
            position = camera.position
            flySpeed = settings.getSetting("controls", "flySpeed") / 10

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

            if [37, 38, 39, 40].includes event.keyCode

                if event.keyCode == 38 or event.keyCode == 40 # Up or Down

                    inverter = - 1

                    if verticalAngle > 90

                        verticalAngle = 180 - verticalAngle; inverter = - inverter

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

                    newHorizontalAngle = horizontalAngle + 90

                    if newHorizontalAngle >= 180

                        newHorizontalAngle = newHorizontalAngle - 360

                    stepX = side$angle newHorizontalAngle, flySpeed, true, null
                    stepY = side$angle newHorizontalAngle, flySpeed, null, true

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

                panel.find("#position-x input").val position.x.toFixed 2
                panel.find("#position-y input").val position.y.toFixed 2
                panel.find("#position-z input").val position.z.toFixed 2

                panel.find("#target-x input").val target.x.toFixed 2
                panel.find("#target-y input").val target.y.toFixed 2
                panel.find("#target-z input").val target.z.toFixed 2

            if [65, 68, 83, 87].includes event.keyCode

                if event.keyCode == 87 # W

                    newVerticalAngle = verticalAngle + flySpeed

                    if newVerticalAngle <= 0

                        newVerticalAngle = satoshi

                    else if newVerticalAngle >= 180

                        newVerticalAngle = - 180 - satoshi

                    target.z = position.z - side$angle newVerticalAngle, radius3, true, null

                    radius2 = side$sides Math.abs(position.z - target.z), null, radius3

                    target.x = position.x - side$angle horizontalAngle, radius2, true, null
                    target.y = position.y - side$angle horizontalAngle, radius2, null, true

                else if event.keyCode == 83 # S

                    newVerticalAngle = verticalAngle - flySpeed

                    if newVerticalAngle <= 0

                        newVerticalAngle = satoshi

                    else if newVerticalAngle >= 180

                        newVerticalAngle = - 180 - satoshi

                    target.z = position.z - side$angle newVerticalAngle, radius3, true, null

                    radius2 = side$sides Math.abs(position.z - target.z), null, radius3

                    target.x = position.x - side$angle horizontalAngle, radius2, true, null
                    target.y = position.y - side$angle horizontalAngle, radius2, null, true

                else if event.keyCode == 65 # A

                    newHorizontalAngle = horizontalAngle + flySpeed

                    if newHorizontalAngle >= 180

                        newHorizontalAngle = newHorizontalAngle - 360

                    target.x = position.x - side$angle newHorizontalAngle, radius2, true, null
                    target.y = position.y - side$angle newHorizontalAngle, radius2, null, true

                else if event.keyCode == 68 # D

                    newHorizontalAngle = horizontalAngle - flySpeed

                    if newHorizontalAngle >= 180

                        newHorizontalAngle = newHorizontalAngle - 360

                    target.x = position.x - side$angle newHorizontalAngle, radius2, true, null
                    target.y = position.y - side$angle newHorizontalAngle, radius2, null, true

                panel.find("#target-x input").val target.x.toFixed 2
                panel.find("#target-y input").val target.y.toFixed 2
                panel.find("#target-z input").val target.z.toFixed 2

            camera.lookAt target.x, target.y, target.z

            if tooltips.getSelected() then tooltips.updateRotationTools()

    ).keyup (event) ->

        if [37, 38, 39, 40, 65, 68, 83, 87].includes event.keyCode

            if [37, 38, 39, 40].includes event.keyCode

                settings.setSetting "camera", "position", camera.position

            settings.setSetting "camera", "target", camera.target

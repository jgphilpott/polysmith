focus = (point, duration = 1000, steps = 100) ->

    target = camera.target
    panel = $ "#camera.panel"

    if point.x != target.x or point.y != target.y or point.z != target.z

        stepX = (point.x - target.x) / steps
        stepY = (point.y - target.y) / steps
        stepZ = (point.z - target.z) / steps

        updateCameraTarget = () ->

            target.x += stepX
            target.y += stepY
            target.z += stepZ

            camera.lookAt target.x, target.y, target.z

            panel.find("#target-x input").val target.x.toFixed 2
            panel.find("#target-y input").val target.y.toFixed 2
            panel.find("#target-z input").val target.z.toFixed 2

            if tooltips.getSelected() then tooltips.updateRotationTools()

        for step in [0...steps]

            setTimeout updateCameraTarget, duration / steps * step

        settings.setSetting "camera", "target", x: point.x, y: point.y, z: point.z

        return true

    else

        return false
